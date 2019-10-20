package com.jubiter.plugin;

import android.Manifest;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
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
import androidx.core.content.ContextCompat;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * JuBiterPlugin
 *
 * @author fengshuo
 * @date 2019/10/08
 */
public class JuBiterPlugin implements MethodCallHandler, PluginRegistry.RequestPermissionsResultListener {

    private static final String TAG = "JuBiterPlugin";
    private static final String NAMESPACE = "com.jubiter.plugin";
    private static final int REQUEST_COARSE_LOCATION_PERMISSIONS = 1452;

    private static final String METHOD_CHANNEL_NAME = NAMESPACE + "/methods";
    private static final String EVENT_SCAN_RESULT_CHANNEL = NAMESPACE + "/scanResult";
    private static final String EVENT_CONNECT_STATE_CHANNEL = NAMESPACE + "/state";

    private final Registrar register;
    private final Activity activity;
    private final MethodChannel methodChannel;
    private final EventChannel scanResultChannel;
//    private final EventChannel connectStateChannel;

    private MethodCall pendingCall;
    private Result pendingResult;
    private Object mLock = new Object();

    private Handler uiHandler = new Handler(Looper.getMainLooper());

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final JuBiterPlugin instance = new JuBiterPlugin(registrar);
    }

    public JuBiterPlugin(Registrar registrar) {
        this.register = registrar;
        this.activity = registrar.activity();
        this.methodChannel = new MethodChannel(registrar.messenger(), METHOD_CHANNEL_NAME);
        this.methodChannel.setMethodCallHandler(this);
        this.scanResultChannel = new EventChannel(registrar.messenger(), EVENT_SCAN_RESULT_CHANNEL);
        this.scanResultChannel.setStreamHandler(scanResultHandler);
//        this.connectStateChannel = new EventChannel(registrar.messenger(), EVENT_CONNECT_STATE_CHANNEL);
//        this.connectStateChannel.setStreamHandler(connectStateHandler);
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        switch (call.method) {
            case "getPlatformVersion":
                result.success("Android " + android.os.Build.VERSION.RELEASE);
                break;

            case "generateMnemonic": {
                Log.d(TAG, ">>> generateMnemonic");
                generateMnemonic(call, result);
                break;
            }

            case "checkMnemonic": {
                checkMnemonic(call, result);
                break;
            }

            case "generateSeed": {
                generateSeed(call, result);
                break;
            }

            case "seedToMasterPrivateKey": {
                seedToMasterPrivateKey(call, result);
                break;
            }

            case "getDeviceInfo": {
                getDeviceInfo(call, result);
                break;
            }

            case "getDeviceCert": {
                getDeviceCert(call, result);
                break;
            }

            case "sendApdu": {
                sendApdu(call, result);
                break;
            }

            case "isInitialize": {
                isInitialize(call, result);
                break;
            }

            case "isBootLoader": {
                isBootLoader(call, result);
                break;
            }

            case "setTimeout": {
                setTimeout(call, result);
                break;
            }

            case "enumApplets": {
                enumApplets(call, result);
                break;
            }

            case "enumSupportCoins": {
                enumSupportCoins(call, result);
                break;
            }

            case "getAppletVersion": {
                getAppletVersion(call, result);
                break;
            }

            case "queryBattery": {
                queryBattery(call, result);
                break;
            }

            case "clearContext": {
                clearContext(call, result);
                break;
            }

            case "showVirtualPWD": {
                showVirtualPWD(call, result);
                break;
            }

            case "cancelVirtualPWD": {
                cancelVirtualPWD(call, result);
                break;
            }

            case "verifyPIN": {
                verifyPIN(call, result);
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
                initDevice(call, result);
                break;
            }

            case "startScan": {
//                if (ContextCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_COARSE_LOCATION)
//                        != PackageManager.PERMISSION_GRANTED
//                        && ContextCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION)
//                        != PackageManager.PERMISSION_GRANTED) {
//                    ActivityCompat.requestPermissions(
//                            activity,
//                            new String[]{
//                                    Manifest.permission.ACCESS_COARSE_LOCATION,
//                                    Manifest.permission.ACCESS_FINE_LOCATION
//                            },
//                            REQUEST_COARSE_LOCATION_PERMISSIONS);
//                    pendingCall = call;
//                    pendingResult = result;
//                    break;
//                }
                startScan(call, result);
                break;
            }

            case "stopScan": {
                stopScan(call, result);
                break;
            }

            case "connectDeviceAsync": {
                connectDeviceAsync(call, result);
                break;
            }

            case "cancelConnect": {
                cancelConnect(call, result);
                break;
            }

            case "disconnectDevice": {
                disconnectDevice(call, result);
                break;
            }

            case "isConnected": {
                isConnected(call, result);
                break;
            }

            // BTC
            case "BTCCreateContext_Software": {
                BTCCreateContext_Software(call, result);
                break;
            }

            case "BTCCreateContext": {
                BTCCreateContext(call, result);
                break;
            }

            case "BTCGetMainHDNode": {
                BTCGetMainHDNode(call, result);
                break;
            }

            case "BTCGetHDNode": {
                BTCGetHDNode(call, result);
                break;
            }

            case "BTCGetAddress": {
                BTCGetAddress(call, result);
                break;
            }

            case "BTCSetAddress": {
                BTCSetAddress(call, result);
                break;
            }

            case "BTCSetUint": {
                BTCSetUint(call, result);
                break;
            }

            case "BTCSignTransaction": {
                BTCSignTransaction(call, result);
                break;
            }

            case "BTCBuildUSDTOutput": {
                BTCBuildUSDTOutput(call, result);
                break;
            }

            // ETH
            case "ETHCreateContext_Software": {
                ETHCreateContext_Software(call, result);
                break;
            }

            case "ETHCreateContext": {
                ETHCreateContext(call, result);
                break;
            }

            case "ETHGetMainHDNode": {
                ETHGetMainHDNode(call, result);
                break;
            }

            case "ETHGetHDNode": {
                ETHGetHDNode(call, result);
                break;
            }

            case "ETHGetAddress": {
                ETHGetAddress(call, result);
                break;
            }

            case "ETHSetAddress": {
                ETHSetAddress(call, result);
                break;
            }

            case "ETHSignTransaction": {
                ETHSignTransaction(call, result);
                break;
            }

            case "ETHBuildERC20Abi": {
                ETHBuildERC20Abi(call, result);
                break;
            }

            default:
                result.notImplemented();
                break;
        }
    }


    private void generateMnemonic(MethodCall call, Result result) {
        CommonProtos.ENUM_MNEMONIC_STRENGTH strength = CommonProtos.ENUM_MNEMONIC_STRENGTH.forNumber((int) call.arguments);
        result.success(JuBiterWallet.generateMnemonic(strength).toByteArray());
    }

    private void checkMnemonic(MethodCall call, Result result) {
        String mnemonic = (String) call.arguments;
        result.success(JuBiterWallet.checkMnemonic(mnemonic));
    }

    private void generateSeed(MethodCall call, Result result) {
        String mnemonic = call.argument("mnemonic");
        String passphrase = call.argument("passphrase");
        result.success(JuBiterWallet.generateSeed(mnemonic, passphrase).toByteArray());
    }

    private void seedToMasterPrivateKey(MethodCall call, Result result) {
        String seed = call.argument("seed");
        CommonProtos.CURVES curve = CommonProtos.CURVES.forNumber(call.argument("curves"));
        result.success(JuBiterWallet.seedToMasterPrivateKey(seed, curve).toByteArray());
    }

    // todo： check
    private void getDeviceInfo(MethodCall call, Result result) {
        int deviceID = call.arguments();
        result.success(JuBiterWallet.getDeviceInfo(deviceID).toByteArray());
    }

    private void getDeviceCert(MethodCall call, Result result) {
        int deviceID = call.arguments();
        result.success(JuBiterWallet.getDeviceCert(deviceID).toByteArray());
    }

    private void sendApdu(MethodCall call, Result result) {
        int deviceID = call.argument("deviceID");
        String apdu = call.argument("apdu");
        result.success(JuBiterWallet.sendApdu(deviceID, apdu).toByteArray());
    }

    private void isInitialize(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        result.success(JuBiterWallet.isInitialize(deviceID));
    }

    private void isBootLoader(MethodCall call, Result result) {
        int deviceID = call.arguments();
        result.success(JuBiterWallet.isBootLoader(deviceID));
    }

    private void setTimeout(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        int timeout = call.argument("timeout");
        result.success(JuBiterWallet.setTimeout(contextID, timeout));
    }

    private void enumApplets(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        result.success(JuBiterWallet.enumApplets(deviceID).toByteArray());
    }

    private void enumSupportCoins(MethodCall call, Result result) {
        int deviceID = call.arguments();
        result.success(JuBiterWallet.enumSupportCoins(deviceID).toByteArray());
    }

    private void getAppletVersion(MethodCall call, Result result) {
        int deviceID = call.argument("deviceID");
        String appletID = call.argument("appletID");
        result.success(JuBiterWallet.getAppletVersion(deviceID, appletID).toByteArray());
    }

    private void queryBattery(MethodCall call, Result result) {
        int deviceID = call.arguments();
        result.success(JuBiterWallet.queryBattery(deviceID).toByteArray());
    }

    private void clearContext(MethodCall call, Result result) {
        int contextID = call.arguments();
        result.success(JuBiterWallet.clearContext(contextID));
    }

    private void showVirtualPWD(MethodCall call, Result result) {
        int contextID = call.arguments();
        result.success(JuBiterWallet.showVirtualPWD(contextID));
    }

    private void cancelVirtualPWD(MethodCall call, Result result) {
        int contextID = call.arguments();
        result.success(JuBiterWallet.cancelVirtualPWD(contextID));
    }

    private void verifyPIN(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        String PIN = call.argument("PIN");
        result.success(JuBiterWallet.verifyPIN(contextID, PIN).toByteArray());
    }

    //************************************ 蓝牙接口 **************************************

    private void initDevice(MethodCall call, Result result) {
        result.success(JuBiterWallet.initDevice());
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
                // unused
                JuBiterProtos.AdvertisementData advertisementData = JuBiterProtos.AdvertisementData.newBuilder()
                        .build();
                JuBiterProtos.ScanResult scanResult = JuBiterProtos.ScanResult.newBuilder()
                        .setAdvertisementData(advertisementData)
                        .setDevice(jubiterDevice)
                        .build();
                // 实时通知 flutter 端扫描结果
                scanResultSink.success(scanResult.toByteArray());
            }

            @Override
            public void onStop() {
                Log.d(TAG, ">>> onStop");
                scanResultSink.endOfStream();
            }

            @Override
            public void onError(int error) {
                Log.d(TAG, ">>> onError");
                result.error(String.valueOf(error), null, null);
            }
        };
        JuBiterWallet.startScan(scanResultCallback);
        result.success(null);
    }

    private void stopScan(MethodCall call, Result result) {
        result.success(JuBiterWallet.stopScan());
    }

//    private EventChannel.EventSink connectStateSink;
//    private final EventChannel.StreamHandler connectStateHandler = new EventChannel.StreamHandler() {
//        @Override
//        public void onListen(Object o, EventChannel.EventSink sink) {
//            Log.d(TAG, ">>> connect onListen");
//            connectStateSink = sink;
//        }
//
//        @Override
//        public void onCancel(Object o) {
//            Log.d(TAG, ">>> connect onCancel");
////            connectStateSink = null;
//        }
//    };

    private void connectDeviceAsync(MethodCall call, Result result) {
        byte[] data = call.arguments();
        JuBiterProtos.ConnectRequest request;
        try {
            request = JuBiterProtos.ConnectRequest.parseFrom(data);
        } catch (InvalidProtocolBufferException e) {
            result.error("RuntimeException", e.getMessage(), e);
            return;
        }

        final ConnectionStateCallback connectionStateCallback = new ConnectionStateCallback() {
            @Override
            public void onConnected(String mac, int deviceID) {
                Log.d(TAG, ">>> onConnected: " + mac + " deviceID:" + deviceID);
                JuBiterProtos.DeviceStateResponse deviceStateResponse = JuBiterProtos.DeviceStateResponse.newBuilder()
                        .setRemoteId(mac)
                        .setState(JuBiterProtos.DeviceStateResponse.BluetoothDeviceState.CONNECTED)
                        .build();
                uiHandler.post(new Runnable() {
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
                uiHandler.post(new Runnable() {
                    @Override
                    public void run() {
                        methodChannel.invokeMethod("DeviceState", deviceStateResponse.toByteArray());
                    }
                });
            }

            @Override
            public void onError(int error) {
                Log.d(TAG, ">>> onError: " + error);
                uiHandler.post(new Runnable() {
                    @Override
                    public void run() {
                        result.error(String.valueOf(error), null, null);
                    }
                });
            }
        };
        String address = request.getRemoteId();
        int timeout = request.getTimeout() * 1000;
        JuBiterWallet.connectDeviceAsync(address, timeout, connectionStateCallback);
    }

    private void cancelConnect(MethodCall call, Result result) {
        String address = (String) call.arguments;
        result.success(JuBiterWallet.cancelConnect(address));
    }

    private void disconnectDevice(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        result.success(JuBiterWallet.disconnectDevice(deviceID));
    }

    private void isConnected(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        result.success(JuBiterWallet.isConnected(deviceID));
    }

    //************************************ BTC接口 **************************************

    private void BTCCreateContext_Software(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            String xPrikey = call.argument("xPrikey");
            BitcoinProtos.ContextCfgBTC contextCfgBTC = BitcoinProtos.ContextCfgBTC.parseFrom(config);
            result.success(JuBiterBitcoin.createContext_Software(contextCfgBTC, xPrikey).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void BTCCreateContext(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            int deviceID = call.argument("deviceID");
            BitcoinProtos.ContextCfgBTC contextCfgBTC = BitcoinProtos.ContextCfgBTC.parseFrom(config);
            result.success(JuBiterBitcoin.createContext(contextCfgBTC, deviceID).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void BTCGetMainHDNode(MethodCall call, Result result) {
        int contextID = (int) call.arguments;
        result.success(JuBiterBitcoin.getMainHDNode(contextID).toByteArray());
    }

    private void BTCGetHDNode(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] path = call.argument("bip32Path");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(path);
            result.success(JuBiterBitcoin.getHDNode(contextID, bip32Path).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void BTCGetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] path = call.argument("bip32Path");
            boolean isShow = call.argument("isShow");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(path);
            result.success(JuBiterBitcoin.getAddress(contextID, bip32Path, isShow).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void BTCSetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] path = call.argument("bip32Path");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(path);
            result.success(JuBiterBitcoin.setAddress(contextID, bip32Path).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void BTCSignTransaction(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] txInfo = call.argument("txInfo");
            BitcoinProtos.TransactionBTC transactionBTC = BitcoinProtos.TransactionBTC.parseFrom(txInfo);
            result.success(JuBiterBitcoin.signTransaction(contextID, transactionBTC).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void BTCSetUint(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        byte[] uint = call.argument("uintType");
        BitcoinProtos.BTC_UNIT_TYPE uintType = BitcoinProtos.BTC_UNIT_TYPE.valueOf(new String(uint));
        result.success(JuBiterBitcoin.setUint(contextID, uintType));
    }

    private void BTCBuildUSDTOutput(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        String usdtTo = call.argument("usdtTo");
        long amount = call.argument("amount");
        result.success(JuBiterBitcoin.buildUSDTOutput(contextID, usdtTo, amount).toByteArray());
    }

    //************************************ ETH接口 **************************************

    private void ETHCreateContext_Software(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            String xPrikey = call.argument("xPrikey");
            EthereumProtos.ContextCfgETH contextCfgETH = EthereumProtos.ContextCfgETH.parseFrom(config);
            result.success(JuBiterEthereum.createContext_Software(contextCfgETH, xPrikey).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void ETHCreateContext(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            int deviceID = call.argument("deviceID");
            EthereumProtos.ContextCfgETH contextCfgETH = EthereumProtos.ContextCfgETH.parseFrom(config);
            result.success(JuBiterEthereum.createContext(contextCfgETH, deviceID).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void ETHGetMainHDNode(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        int format = call.argument("format");
        result.success(JuBiterEthereum.getMainHDNode(contextID, EthereumProtos.ENUM_PUB_FORMAT.forNumber(format)).toByteArray());
    }

    private void ETHGetHDNode(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            int format = call.argument("format");
            byte[] bip32 = call.argument("bip32Path");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(bip32);
            result.success(JuBiterEthereum.getHDNode(contextID, EthereumProtos.ENUM_PUB_FORMAT.forNumber(format),
                    bip32Path).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void ETHGetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] bip32 = call.argument("bip32Path");
            boolean isShow = call.argument("isShow");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(bip32);
            result.success(JuBiterEthereum.getAddress(contextID, bip32Path, isShow).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void ETHSetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] bip32 = call.argument("bip32Path");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(bip32);
            result.success(JuBiterEthereum.setAddress(contextID, bip32Path).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void ETHSignTransaction(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] txInfo = call.argument("txInfo");
            EthereumProtos.TransactionETH transactionETH = EthereumProtos.TransactionETH.parseFrom(txInfo);
            result.success(JuBiterEthereum.signTransaction(contextID, transactionETH).toByteArray());
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            result.error(null, null, null);
        }
    }

    private void ETHBuildERC20Abi(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        String address = call.argument("address");
        String amountInWei = call.argument("amountInWei");
        result.success(JuBiterEthereum.buildERC20Abi(contextID, address, amountInWei).toByteArray());
    }

    @Override
    public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        if (requestCode == REQUEST_COARSE_LOCATION_PERMISSIONS) {
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
//                startScan(pendingCall, pendingResult);
                initDevice(pendingCall, pendingResult);
            } else {
                pendingResult.error(
                        "no_permissions", "bluetooth plugin requires location permissions for scanning", null);
                pendingResult = null;
                pendingCall = null;
            }
            return true;
        }
        return false;
    }
}
