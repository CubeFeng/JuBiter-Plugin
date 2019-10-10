package com.jubiter.plugin;

import android.app.Activity;

import com.google.protobuf.InvalidProtocolBufferException;
import com.jubiter.sdk.ConnectionStateCallback;
import com.jubiter.sdk.JuBiterBLEDevice;
import com.jubiter.sdk.JuBiterBitcoin;
import com.jubiter.sdk.JuBiterEthereum;
import com.jubiter.sdk.JuBiterWallet;
import com.jubiter.sdk.ScanResultCallback;
import com.jubiter.sdk.proto.BitcoinProtos;
import com.jubiter.sdk.proto.CommonProtos;
import com.jubiter.sdk.proto.EthereumProtos;

import io.flutter.Log;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * JuBiterPlugin
 *
 * @author fengshuo
 * @date 2019/10/08
 */
public class JuBiterPlugin implements MethodCallHandler {

    private static final String TAG = "JuBiterPlugin";

    private static final String METHOD_CHANNEL_NAME = "plugin";

    private final Registrar register;
    private final Activity activity;
    private final MethodChannel channel;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final JuBiterPlugin instance = new JuBiterPlugin(registrar);
    }

    public JuBiterPlugin(Registrar registrar) {
        this.register = registrar;
        this.activity = registrar.activity();
        this.channel = new MethodChannel(registrar.messenger(), METHOD_CHANNEL_NAME);
        channel.setMethodCallHandler(this);
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
                initDevice();
                break;
            }

            case "startScan": {
                startScan(call, result);
                break;
            }

            case "stopScan": {
                stopScan();
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
        CommonProtos.CURVES curve = call.argument("curve");
        result.success(JuBiterWallet.seedToMasterPrivateKey(seed, curve).toByteArray());
    }

    // todo： check
    private byte[] getDeviceInfo(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.getDeviceInfo(deviceID).toByteArray();
    }

    private byte[] getDeviceCert(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.getDeviceCert(deviceID).toByteArray();
    }

    private byte[] sendApdu(MethodCall call, Result result) {
        int deviceID = call.argument("deviceID");
        String apdu = call.argument("apdu");
        return JuBiterWallet.sendApdu(deviceID, apdu).toByteArray();
    }

    private boolean isInitialize(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.isInitialize(deviceID);
    }

    private boolean isBootLoader(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.isBootLoader(deviceID);
    }

    private byte[] setTimeout(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        int timeout = call.argument("timeout");
        return JuBiterWallet.setTimeout(contextID, timeout).toByteArray();
    }

    private byte[] enumApplets(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.enumApplets(deviceID).toByteArray();
    }

    private byte[] enumSupportCoins(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.enumSupportCoins(deviceID).toByteArray();
    }

    private byte[] getAppletVersion(MethodCall call, Result result) {
        int deviceID = call.argument("deviceID");
        String appletID = call.argument("appletID");
        return JuBiterWallet.getAppletVersion(deviceID, appletID).toByteArray();
    }

    private byte[] queryBattery(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.queryBattery(deviceID).toByteArray();
    }

    private int clearContext(MethodCall call, Result result) {
        int contextID = (int) call.arguments;
        return JuBiterWallet.clearContext(contextID);
    }

    private int showVirtualPWD(MethodCall call, Result result) {
        int contextID = (int) call.arguments;
        return JuBiterWallet.showVirtualPWD(contextID);
    }

    private int cancelVirtualPWD(MethodCall call, Result result) {
        int contextID = (int) call.arguments;
        return JuBiterWallet.cancelVirtualPWD(contextID);
    }

    private byte[] verifyPIN(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        String PIN = call.argument("PIN");
        return JuBiterWallet.verifyPIN(contextID, PIN).toByteArray();
    }

    //************************************ 蓝牙接口 **************************************

    private int initDevice() {
        return JuBiterWallet.initDevice();
    }

    private void startScan(MethodCall call, final Result result) {
        final ScanResultCallback scanResultCallback = new ScanResultCallback() {
            @Override
            public void onScanResult(JuBiterBLEDevice device) {
                result.success(null);
            }

            @Override
            public void onStop() {

            }

            @Override
            public void onError(int i) {

            }
        };
        JuBiterWallet.startScan(scanResultCallback);
    }

    private int stopScan() {
        return JuBiterWallet.stopScan();
    }

    private void connectDeviceAsync(MethodCall call, Result result) {
        String address = call.argument("address");
        int timeout = call.argument("timeout");
        final ConnectionStateCallback connectionStateCallback = new ConnectionStateCallback() {
            @Override
            public void onConnected(String s, int i) {

            }

            @Override
            public void onDisconnected(String s) {

            }

            @Override
            public void onError(int i) {

            }
        };
        JuBiterWallet.connectDeviceAsync(address, timeout, connectionStateCallback);
    }

    private int cancelConnect(MethodCall call, Result result) {
        String address = (String) call.arguments;
        return JuBiterWallet.cancelConnect(address);
    }

    private int disconnectDevice(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.disconnectDevice(deviceID);
    }

    private boolean isConnected(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.isConnected(deviceID);
    }

    //************************************ BTC接口 **************************************

    private byte[] BTCCreateContext_Software(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            String xPrikey = call.argument("xPrikey");
            BitcoinProtos.ContextCfgBTC contextCfgBTC = BitcoinProtos.ContextCfgBTC.parseFrom(config);
            return JuBiterBitcoin.createContext_Software(contextCfgBTC, xPrikey).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] BTCCreateContext(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            int deviceID = call.argument("deviceID");
            BitcoinProtos.ContextCfgBTC contextCfgBTC = BitcoinProtos.ContextCfgBTC.parseFrom(config);
            return JuBiterBitcoin.createContext(contextCfgBTC, deviceID).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] BTCGetMainHDNode(MethodCall call, Result result) {
        int deviceID = (int) call.arguments;
        return JuBiterBitcoin.getMainHDNode(deviceID).toByteArray();
    }

    private byte[] BTCGetHDNode(MethodCall call, Result result) {
        try {
            int deviceID = call.argument("deviceID");
            byte[] path = call.argument("bip32Path");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(path);
            return JuBiterBitcoin.getHDNode(deviceID, bip32Path).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] BTCGetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] path = call.argument("bip32Path");
            boolean isShow = call.argument("isShow");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(path);
            return JuBiterBitcoin.getAddress(contextID, bip32Path, isShow).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] BTCSetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] path = call.argument("bip32Path");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(path);
            return JuBiterBitcoin.setAddress(contextID, bip32Path).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] BTCSignTransaction(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] txInfo = call.argument("txInfo");
            BitcoinProtos.TransactionBTC transactionBTC = BitcoinProtos.TransactionBTC.parseFrom(txInfo);
            return JuBiterBitcoin.signTransaction(contextID, transactionBTC).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private int BTCSetUint(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        byte[] uint = call.argument("uintType");
        BitcoinProtos.BTC_UNIT_TYPE uintType = BitcoinProtos.BTC_UNIT_TYPE.valueOf(new String(uint));
        return JuBiterBitcoin.setUint(contextID, uintType);
    }

    private byte[] BTCBuildUSDTOutput(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        String usdtTo = call.argument("usdtTo");
        long amount = call.argument("amount");
        return JuBiterBitcoin.buildUSDTOutput(contextID, usdtTo, amount).toByteArray();
    }

    //************************************ ETH接口 **************************************

    private byte[] ETHCreateContext_Software(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            String xPrikey = call.argument("xPrikey");
            EthereumProtos.ContextCfgETH contextCfgETH = EthereumProtos.ContextCfgETH.parseFrom(config);
            return JuBiterEthereum.createContext_Software(contextCfgETH, xPrikey).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] ETHCreateContext(MethodCall call, Result result) {
        try {
            byte[] config = call.argument("config");
            int deviceID = call.argument("deviceID");
            EthereumProtos.ContextCfgETH contextCfgETH = EthereumProtos.ContextCfgETH.parseFrom(config);
            return JuBiterEthereum.createContext(contextCfgETH, deviceID).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] ETHGetMainHDNode(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        int format = call.argument("format");
        return JuBiterEthereum.getMainHDNode(contextID, EthereumProtos.ENUM_PUB_FORMAT.forNumber(format)).toByteArray();
    }

    private byte[] ETHGetHDNode(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            int format = call.argument("format");
            byte[] bip32 = call.argument("bip32");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(bip32);
            return JuBiterEthereum.getHDNode(contextID, EthereumProtos.ENUM_PUB_FORMAT.forNumber(format),
                    bip32Path).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] ETHGetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] bip32 = call.argument("bip32Path");
            boolean isShow = call.argument("isShow");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(bip32);
            return JuBiterEthereum.getAddress(contextID, bip32Path, isShow).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] ETHSetAddress(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] bip32 = call.argument("bip32Path");
            CommonProtos.Bip32Path bip32Path = CommonProtos.Bip32Path.parseFrom(bip32);
            return JuBiterEthereum.setAddress(contextID, bip32Path).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] ETHSignTransaction(MethodCall call, Result result) {
        try {
            int contextID = call.argument("contextID");
            byte[] txInfo = call.argument("txInfo");
            EthereumProtos.TransactionETH transactionETH = EthereumProtos.TransactionETH.parseFrom(txInfo);
            return JuBiterEthereum.signTransaction(contextID, transactionETH).toByteArray();
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return null;
        }
    }

    private byte[] ETHBuildERC20Abi(MethodCall call, Result result) {
        int contextID = call.argument("contextID");
        String address = call.argument("address");
        String amountInWei = call.argument("amountInWei");
        return JuBiterEthereum.buildERC20Abi(contextID, address, amountInWei).toByteArray();
    }

}
