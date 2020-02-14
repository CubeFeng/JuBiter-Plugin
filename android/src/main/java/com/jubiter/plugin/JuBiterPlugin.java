package com.jubiter.plugin;

import android.Manifest;
import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;

import com.google.protobuf.InvalidProtocolBufferException;
import com.jubiter.plugin.protos.JuBiterProtos;
import com.jubiter.sdk.ConnectionStateCallback;
import com.jubiter.sdk.JuBiterBLEDevice;
import com.jubiter.sdk.JuBiterBitcoin;
import com.jubiter.sdk.JuBiterEthereum;
import com.jubiter.sdk.JuBiterWallet;
import com.jubiter.sdk.ScanResultCallback;
import com.jubiter.sdk.proto.BitcoinProtos;
import com.jubiter.sdk.proto.CommonProtos;
import com.jubiter.sdk.proto.EthereumProtos;

import androidx.core.app.ActivityCompat;
import androidx.core.app.ActivityOptionsCompat;
import androidx.core.content.ContextCompat;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener;

/**
 * JuBiterPlugin
 *
 * @author fengshuo
 * @date 2019/10/08
 */
public class JuBiterPlugin implements MethodCallHandler, RequestPermissionsResultListener,
        PluginRegistry.ActivityResultListener {

    private static final String TAG = "JuBiterPlugin";
    private static final String NAMESPACE = "com.jubiter.plugin";
    private static final int REQUEST_COARSE_LOCATION_PERMISSIONS = 1452;
    private static final int REQUEST_ENABLE_BLUETOOTH_ADAPTER = 100;

    private static final String METHOD_CHANNEL_NAME = NAMESPACE + "/methods";
    private static final String EVENT_SCAN_RESULT_CHANNEL = NAMESPACE + "/scanResult";
    private static final String EVENT_CONNECT_STATE_CHANNEL = NAMESPACE + "/state";

    private final Registrar register;
    private final Activity activity;
    private final MethodChannel methodChannel;
    private final EventChannel scanResultChannel;

    private MethodCall pendingCall;
    private Result pendingResult;
    private Object mLock = new Object();

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final JuBiterPlugin instance = new JuBiterPlugin(registrar);
        // 添加权限请求监听
        registrar.addRequestPermissionsResultListener(instance);
        registrar.addActivityResultListener(instance);
    }

    public JuBiterPlugin(Registrar registrar) {
        this.register = registrar;
        this.activity = registrar.activity();
        this.methodChannel = new MethodChannel(registrar.messenger(), METHOD_CHANNEL_NAME);
        this.methodChannel.setMethodCallHandler(this);
        this.scanResultChannel = new EventChannel(registrar.messenger(), EVENT_SCAN_RESULT_CHANNEL);
        this.scanResultChannel.setStreamHandler(scanResultHandler);
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        switch (call.method) {
            case "getPlatformVersion":
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                break;

            case "generateMnemonic": {
                Log.d(TAG, ">>> generateMnemonic");
                ThreadUtil.subThread(() -> generateMnemonic(call, result));
                break;
            }

            case "checkMnemonic": {
                ThreadUtil.subThread(() -> checkMnemonic(call, result));
                break;
            }

            case "generateSeed": {
                ThreadUtil.subThread(() -> generateSeed(call, result));
                break;
            }

            case "seedToMasterPrivateKey": {
                ThreadUtil.subThread(() -> seedToMasterPrivateKey(call, result));
                break;
            }

            case "getDeviceInfo": {
                ThreadUtil.subThread(() -> getDeviceInfo(call, result));
                break;
            }

            case "getDeviceCert": {
                ThreadUtil.subThread(() -> getDeviceCert(call, result));
                break;
            }

            case "sendApdu": {
                ThreadUtil.subThread(() -> sendApdu(call, result));
                break;
            }

            case "isInitialize": {
                ThreadUtil.subThread(() -> isInitialize(call, result));
                break;
            }

            case "isBootLoader": {
                ThreadUtil.subThread(() -> isBootLoader(call, result));
                break;
            }

            case "setTimeout": {
                ThreadUtil.subThread(() -> setTimeout(call, result));
                break;
            }

            case "enumApplets": {
                ThreadUtil.subThread(() -> enumApplets(call, result));
                break;
            }

            case "enumSupportCoins": {
                ThreadUtil.subThread(() -> enumSupportCoins(call, result));
                break;
            }

            case "getAppletVersion": {
                ThreadUtil.subThread(() -> getAppletVersion(call, result));
                break;
            }

            case "queryBattery": {
                ThreadUtil.subThread(() -> queryBattery(call, result));
                break;
            }

            case "clearContext": {
                ThreadUtil.subThread(() -> clearContext(call, result));
                break;
            }

            case "showVirtualPWD": {
                ThreadUtil.subThread(() -> showVirtualPWD(call, result));
                break;
            }

            case "cancelVirtualPWD": {
                ThreadUtil.subThread(() -> cancelVirtualPWD(call, result));
                break;
            }

            case "verifyPIN": {
                ThreadUtil.subThread(() -> verifyPIN(call, result));
                break;
            }

            // 蓝牙
            case "initDevice": {
                if (ContextCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_COARSE_LOCATION)
                        != PackageManager.PERMISSION_GRANTED
                        && ContextCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION)
                        != PackageManager.PERMISSION_GRANTED) {
                    ActivityCompat.requestPermissions(
                            activity,
                            new String[]{
                                    Manifest.permission.ACCESS_COARSE_LOCATION,
                                    Manifest.permission.ACCESS_FINE_LOCATION
                            },
                            REQUEST_COARSE_LOCATION_PERMISSIONS);
                    pendingCall = call;
                    pendingResult = result;
                    break;
                }
                ThreadUtil.subThread(() -> initDevice(call, result));
                break;
            }

            case "startScan": {
                BluetoothAdapter mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
                if (!mBluetoothAdapter.isEnabled()) {
                    Intent enableIntent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
                    Bundle options = ActivityOptionsCompat.makeSceneTransitionAnimation(activity).toBundle();
                    ActivityCompat.startActivityForResult(activity, enableIntent,
                            REQUEST_ENABLE_BLUETOOTH_ADAPTER, options);
                    pendingCall = call;
                    pendingResult = result;
                    return;
                }
                ThreadUtil.subThread(() -> startScan(call, result));
                break;
            }

            case "stopScan": {
                ThreadUtil.subThread(() -> stopScan(call, result));
                break;
            }

            case "connectDeviceAsync": {
                ThreadUtil.subThread(() -> connectDeviceAsync(call, result));
                break;
            }

            case "cancelConnect": {
                ThreadUtil.subThread(() -> cancelConnect(call, result));
                break;
            }

            case "disconnectDevice": {
                ThreadUtil.subThread(() -> disconnectDevice(call, result));
                break;
            }

            case "isConnected": {
                ThreadUtil.subThread(() -> isConnected(call, result));
                break;
            }

            // BTC
            case "BTCCreateContext_Software": {
                ThreadUtil.subThread(() -> BTCCreateContext_Software(call, result));
                break;
            }

            case "BTCCreateContext": {
                ThreadUtil.subThread(() -> BTCCreateContext(call, result));
                break;
            }

            case "BTCGetMainHDNode": {
                ThreadUtil.subThread(() -> BTCGetMainHDNode(call, result));
                break;
            }

            case "BTCGetHDNode": {
                ThreadUtil.subThread(() -> BTCGetHDNode(call, result));
                break;
            }

            case "BTCGetAddress": {
                ThreadUtil.subThread(() -> BTCGetAddress(call, result));
                break;
            }

            case "BTCSetAddress": {
                ThreadUtil.subThread(() -> BTCSetAddress(call, result));
                break;
            }

            case "BTCSetUint": {
                ThreadUtil.subThread(() -> BTCSetUint(call, result));
                break;
            }

            case "BTCSignTransaction": {
                ThreadUtil.subThread(() -> BTCSignTransaction(call, result));
                break;
            }

            case "BTCBuildUSDTOutput": {
                ThreadUtil.subThread(() -> BTCBuildUSDTOutput(call, result));
                break;
            }

            // ETH
            case "ETHCreateContext_Software": {
                ThreadUtil.subThread(() -> ETHCreateContext_Software(call, result));
                break;
            }

            case "ETHCreateContext": {
                ThreadUtil.subThread(() -> ETHCreateContext(call, result));
                break;
            }

            case "ETHGetMainHDNode": {
                ThreadUtil.subThread(() -> ETHGetMainHDNode(call, result));
                break;
            }

            case "ETHGetHDNode": {
                ThreadUtil.subThread(() -> ETHGetHDNode(call, result));
                break;
            }

            case "ETHGetAddress": {
                ThreadUtil.subThread(() -> ETHGetAddress(call, result));
                break;
            }

            case "ETHSetAddress": {
                ThreadUtil.subThread(() -> ETHSetAddress(call, result));
                break;
            }

            case "ETHSignTransaction": {
                ThreadUtil.subThread(() -> ETHSignTransaction(call, result));
                break;
            }

            case "ETHBuildERC20Abi": {
                ThreadUtil.subThread(() -> ETHBuildERC20Abi(call, result));
                break;
            }

            default:
                result.notImplemented();
                break;
        }
    }


    private void generateMnemonic(MethodCall call, Result result) {
        CommonProtos.ENUM_MNEMONIC_STRENGTH strength = CommonProtos.ENUM_MNEMONIC_STRENGTH.forNumber((int) call.arguments);
        CommonProtos.ResultString resultString = JuBiterWallet.generateMnemonic(strength);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void checkMnemonic(MethodCall call, Result result) {
        String mnemonic = (String) call.arguments;
        int ret = JuBiterWallet.checkMnemonic(mnemonic);
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private void generateSeed(MethodCall call, Result result) {
        String mnemonic = call.argument("mnemonic");
        String passphrase = call.argument("passphrase");
        CommonProtos.ResultString resultString = JuBiterWallet.generateSeed(mnemonic, passphrase);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void seedToMasterPrivateKey(MethodCall call, Result result) {
        String seed = call.argument("seed");
        CommonProtos.CURVES curve = CommonProtos.CURVES.forNumber(call.argument("curves"));
        CommonProtos.ResultString resultString = JuBiterWallet.seedToMasterPrivateKey(seed, curve);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void getDeviceInfo(MethodCall call, Result result) {
        int deviceID = call.arguments();
        Log.d(TAG, "thread id： " + Thread.currentThread().getId());
        CommonProtos.ResultAny resultAny = JuBiterWallet.getDeviceInfo(deviceID);
        ThreadUtil.toMainThread(() -> result.success(resultAny.toByteArray()));
    }

    private void getDeviceCert(MethodCall call, Result result) {
        int deviceID = call.arguments();
        CommonProtos.ResultString resultString = JuBiterWallet.getDeviceCert(deviceID);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void sendApdu(MethodCall call, Result result) {
        int deviceID = call.argument("deviceID");
        String apdu = call.argument("apdu");
        CommonProtos.ResultString resultString = JuBiterWallet.sendApdu(deviceID, apdu);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void isInitialize(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        boolean resultBoolean = JuBiterWallet.isInitialize(deviceID);
        ThreadUtil.toMainThread(() -> result.success(resultBoolean));
    }

    private void isBootLoader(MethodCall call, Result result) {
        int deviceID = call.arguments();
        boolean resultBoolean = JuBiterWallet.isBootLoader(deviceID);
        ThreadUtil.toMainThread(() -> result.success(resultBoolean));
    }

    private void setTimeout(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        int timeout = call.argument("timeout");
        int ret = JuBiterWallet.setTimeout(contextID, timeout);
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private void enumApplets(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        CommonProtos.ResultString resultString = JuBiterWallet.enumApplets(deviceID);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void enumSupportCoins(MethodCall call, Result result) {
        int deviceID = call.arguments();
        CommonProtos.ResultString resultString = JuBiterWallet.enumSupportCoins(deviceID);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void getAppletVersion(MethodCall call, Result result) {
        int deviceID = call.argument("deviceID");
        String appletID = call.argument("appletID");
        CommonProtos.ResultString resultString = JuBiterWallet.getAppletVersion(deviceID, appletID);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void queryBattery(MethodCall call, Result result) {
        int deviceID = call.arguments();
        CommonProtos.ResultInt resultInt = JuBiterWallet.queryBattery(deviceID);
        ThreadUtil.toMainThread(() -> result.success(resultInt.toByteArray()));
    }

    private void clearContext(MethodCall call, Result result) {
        int contextID = call.arguments();
        int ret = JuBiterWallet.clearContext(contextID);
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private void showVirtualPWD(MethodCall call, Result result) {
        int contextID = call.arguments();
        int ret = JuBiterWallet.showVirtualPWD(contextID);
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private void cancelVirtualPWD(MethodCall call, Result result) {
        int contextID = call.arguments();
        int ret = JuBiterWallet.cancelVirtualPWD(contextID);
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private void verifyPIN(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        String PIN = call.argument("PIN");
        CommonProtos.ResultInt resultInt = JuBiterWallet.verifyPIN(contextID, PIN);
        ThreadUtil.toMainThread(() -> result.success(resultInt.toByteArray()));
    }

    //************************************ 蓝牙接口 **************************************

    private void initDevice(MethodCall call, Result result) {
        int ret = JuBiterWallet.initDevice();
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private EventChannel.EventSink scanResultSink;
    private final EventChannel.StreamHandler scanResultHandler = new EventChannel.StreamHandler() {

        @Override
        public void onListen(Object arguments, EventChannel.EventSink sink) {
            Log.d(TAG, ">>> scan onListen");
            scanResultSink = sink;
        }

        @Override
        public void onCancel(Object o) {
            Log.d(TAG, ">>> scan onCancel");
            scanResultSink = null;
        }
    };

    private void startScan(MethodCall call, final Result result) {
        final ScanResultCallback scanResultCallback = new ScanResultCallback() {
            @Override
            public void onScanResult(JuBiterBLEDevice device) {
                Log.d(TAG, ">>> " + device.toString());
                JuBiterProtos.BluetoothDevice jubiterDevice = JuBiterProtos.BluetoothDevice.newBuilder()
                        .setRemoteId(device.getMac())
                        .setName(device.getName())
                        .setType(JuBiterProtos.BluetoothDevice.Type.LE)
                        .build();

                JuBiterProtos.AdvertisementData advertisementData = JuBiterProtos.AdvertisementData.newBuilder()
                        .build();
                JuBiterProtos.ScanResult scanResult = JuBiterProtos.ScanResult.newBuilder()
                        .setAdvertisementData(advertisementData)
                        .setDevice(jubiterDevice)
                        .build();
                // 实时通知 flutter 端扫描结果
                ThreadUtil.toMainThread(() -> scanResultSink.success(scanResult.toByteArray()));
            }

            @Override
            public void onStop() {
                Log.d(TAG, ">>> onStop");
                scanResultSink.endOfStream();
            }

            @Override
            public void onError(int error) {
                Log.d(TAG, ">>> onError");
                ThreadUtil.toMainThread(() -> result.error(String.valueOf(error), null, null));
            }
        };
        JuBiterWallet.startScan(scanResultCallback);
        ThreadUtil.toMainThread(() -> result.success(null));
    }

    private void stopScan(MethodCall call, Result result) {
        int ret = JuBiterWallet.stopScan();
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private void connectDeviceAsync(MethodCall call, Result result) {
        byte[] data = call.arguments();
        JuBiterProtos.ConnectRequest request;
        try {
            request = JuBiterProtos.ConnectRequest.parseFrom(data);
        } catch (InvalidProtocolBufferException e) {
            ThreadUtil.toMainThread(() -> result.error("RuntimeException", e.getMessage(), e));
            return;
        }

        final ConnectionStateCallback connectionStateCallback = new ConnectionStateCallback() {
            @Override
            public void onConnected(String mac, int deviceID) {
                Log.d(TAG, ">>> onConnected: " + mac + " deviceID:" + deviceID);
                JuBiterProtos.DeviceStateResponse deviceStateResponse = JuBiterProtos.DeviceStateResponse.newBuilder()
                        .setRemoteId(mac)
                        .setDeviceID(deviceID)
                        .setState(JuBiterProtos.DeviceStateResponse.BluetoothDeviceState.CONNECTED)
                        .build();
                ThreadUtil.toMainThread(new Runnable() {
                    @Override
                    public void run() {
                        methodChannel.invokeMethod("DeviceState", deviceStateResponse.toByteArray(), new MethodChannel.Result() {
                            @Override
                            public void success(Object o) {
                                Log.d(TAG, "invoke success");
                            }

                            @Override
                            public void error(String s, String s1, Object o) {
                                Log.d(TAG, "invoke error");
                            }

                            @Override
                            public void notImplemented() {
                                Log.d(TAG, "invoke notImplemented");
                            }
                        });
                    }
                });
            }

            @Override
            public void onDisconnected(String mac) {
                Log.d(TAG, ">>> onDisconnected: " + mac);
                JuBiterProtos.DeviceStateResponse deviceStateResponse = JuBiterProtos.DeviceStateResponse.newBuilder()
                        .setRemoteId(mac)
                        .setState(JuBiterProtos.DeviceStateResponse.BluetoothDeviceState.DISCONNECTED)
                        .build();
                ThreadUtil.toMainThread(
                        () -> methodChannel.invokeMethod("DeviceState", deviceStateResponse.toByteArray()));
            }

            @Override
            public void onError(int error) {
                Log.d(TAG, ">>> onError: " + error);
                ThreadUtil.toMainThread(() -> result.error(String.valueOf(error), null, null));
            }
        };
        String address = request.getRemoteId();
        int timeout = request.getTimeout() * 1000;
        JuBiterWallet.connectDeviceAsync(address, timeout, connectionStateCallback);
    }

    private void cancelConnect(MethodCall call, Result result) {
        String address = (String) call.arguments;
        int ret = JuBiterWallet.cancelConnect(address);
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private void disconnectDevice(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        int ret = JuBiterWallet.disconnectDevice(deviceID);
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private void isConnected(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        boolean state = JuBiterWallet.isConnected(deviceID);
        ThreadUtil.toMainThread(() -> result.success(state));
    }

    //************************************ BTC接口 **************************************

    private void BTCCreateContext_Software(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            String xPrikey = call.argument("xPrikey");
            BitcoinProtos.ContextCfgBTC contextCfgBTC = BitcoinProtos.ContextCfgBTC.parseFrom(config);
            CommonProtos.ResultInt resultInt =
                    JuBiterBitcoin.createContext_Software(contextCfgBTC, xPrikey);
            ThreadUtil.toMainThread(() -> result.success(resultInt.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void BTCCreateContext(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            int deviceID = call.argument("deviceID");
            BitcoinProtos.ContextCfgBTC contextCfgBTC = BitcoinProtos.ContextCfgBTC.parseFrom(config);
            CommonProtos.ResultInt resultInt = JuBiterBitcoin.createContext(contextCfgBTC,
                    deviceID);
            ThreadUtil.toMainThread(() -> result.success(resultInt.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void BTCGetMainHDNode(MethodCall call, Result result) {
        int contextID = (int) call.arguments;
        CommonProtos.ResultString resultString = JuBiterBitcoin.getMainHDNode(contextID);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void BTCGetHDNode(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] path = call.argument("bip32Path");
            CommonProtos.Bip44Path bip44Path = CommonProtos.Bip44Path.parseFrom(path);
            CommonProtos.ResultString resultString = JuBiterBitcoin.getHDNode(contextID, bip44Path);
            ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void BTCGetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] path = call.argument("bip32Path");
            boolean isShow = call.argument("isShow");
            CommonProtos.Bip44Path bip44Path = CommonProtos.Bip44Path.parseFrom(path);
            CommonProtos.ResultString resultString = JuBiterBitcoin.getAddress(contextID,
                    bip44Path, isShow);
            ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void BTCSetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] path = call.argument("bip32Path");
            CommonProtos.Bip44Path bip32Path = CommonProtos.Bip44Path.parseFrom(path);
            CommonProtos.ResultString resultString = JuBiterBitcoin.setAddress(contextID,
                    bip32Path);
            ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void BTCSignTransaction(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] txInfo = call.argument("txInfo");
            BitcoinProtos.TransactionBTC transactionBTC = BitcoinProtos.TransactionBTC.parseFrom(txInfo);
            CommonProtos.ResultString resultString = JuBiterBitcoin.signTransaction(contextID,
                    transactionBTC);
            ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void BTCSetUint(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        byte[] uint = call.argument("uintType");
        BitcoinProtos.BTC_UNIT_TYPE uintType = BitcoinProtos.BTC_UNIT_TYPE.valueOf(new String(uint));
        int ret = JuBiterBitcoin.setUint(contextID, uintType);
        ThreadUtil.toMainThread(() -> result.success(ret));
    }

    private void BTCBuildUSDTOutput(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        String usdtTo = call.argument("usdtTo");
        long amount = call.argument("amount");
        CommonProtos.ResultAny resultAny = JuBiterBitcoin.buildUSDTOutput(contextID, usdtTo,
                amount);
        ThreadUtil.toMainThread(() -> result.success(resultAny.toByteArray()));
    }

    //************************************ ETH接口 **************************************

    private void ETHCreateContext_Software(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            String xPrikey = call.argument("xPrikey");
            EthereumProtos.ContextCfgETH contextCfgETH = EthereumProtos.ContextCfgETH.parseFrom(config);
            CommonProtos.ResultInt resultInt =
                    JuBiterEthereum.createContext_Software(contextCfgETH, xPrikey);
            ThreadUtil.toMainThread(() -> result.success(resultInt.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void ETHCreateContext(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            int deviceID = call.argument("deviceID");
            EthereumProtos.ContextCfgETH contextCfgETH = EthereumProtos.ContextCfgETH.parseFrom(config);
            CommonProtos.ResultInt resultInt = JuBiterEthereum.createContext(contextCfgETH,
                    deviceID);
            ThreadUtil.toMainThread(() -> result.success(resultInt.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void ETHGetMainHDNode(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        int format = call.argument("format");
        CommonProtos.ResultString resultString = JuBiterEthereum.getMainHDNode(contextID,
                CommonProtos.ENUM_PUB_FORMAT.forNumber(format));
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    private void ETHGetHDNode(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            int format = call.argument("format");
            byte[] bip32 = call.argument("bip32Path");
            CommonProtos.Bip44Path bip44Path = CommonProtos.Bip44Path.parseFrom(bip32);
            CommonProtos.ResultString resultString = JuBiterEthereum.getHDNode(contextID,
                    CommonProtos.ENUM_PUB_FORMAT.forNumber(format),
                    bip44Path);
            ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void ETHGetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] bip32 = call.argument("bip32Path");
            boolean isShow = call.argument("isShow");
            CommonProtos.Bip44Path bip44Path = CommonProtos.Bip44Path.parseFrom(bip32);
            CommonProtos.ResultString resultString = JuBiterEthereum.getAddress(contextID,
                    bip44Path, isShow);
            ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void ETHSetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] bip32 = call.argument("bip32Path");
            CommonProtos.Bip44Path bip44Path = CommonProtos.Bip44Path.parseFrom(bip32);
            CommonProtos.ResultString resultString = JuBiterEthereum.setAddress(contextID,
                    bip44Path);
            ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
        } catch (Exception e) {
//        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void ETHSignTransaction(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] txInfo = call.argument("txInfo");
            EthereumProtos.TransactionETH transactionETH = EthereumProtos.TransactionETH.parseFrom(txInfo);
            CommonProtos.ResultString resultString = JuBiterEthereum.signTransaction(contextID,
                    transactionETH);
            ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
//        } catch (InvalidProtocolBufferException e) {
//            e.printStackTrace();
//            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        } catch (Exception e) {
            e.printStackTrace();
            ThreadUtil.toMainThread(() -> result.error(null, null, null));
        }
    }

    private void ETHBuildERC20Abi(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        String tokenName = call.argument("tokenName");
        int unitDP = call.argument("uintDP");
        String contractAddress = call.argument("contractAddress");
        String address = call.argument("address");
        String amountInWei = call.argument("amountInWei");
        CommonProtos.ResultString resultString = JuBiterEthereum.buildERC20Abi(
                contextID,
                tokenName,
                unitDP,
                contractAddress,
                address,
                amountInWei);
        ThreadUtil.toMainThread(() -> result.success(resultString.toByteArray()));
    }

    @Override
    public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == REQUEST_COARSE_LOCATION_PERMISSIONS) {
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
//                startScan(pendingCall, pendingResult);
                ThreadUtil.subThread(() -> initDevice(pendingCall, pendingResult));
            } else {
                Log.e(TAG, ">>> request permission fail");
                ThreadUtil.toMainThread(
                        () -> pendingResult.error("-1", "bluetooth plugin requires location permissions for scanning", null));
                pendingResult = null;
                pendingCall = null;
            }
            return true;
        }
        return false;
    }

    @Override
    public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_ENABLE_BLUETOOTH_ADAPTER) {
            if (resultCode == 0) {
                ThreadUtil.subThread(() -> startScan(pendingCall, pendingResult));
                return true;
            }
            ThreadUtil.toMainThread(
                    () -> pendingResult.error("-1", "BluetoothAdapter is off", null));
        }
        return false;
    }
}
