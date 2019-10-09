package com.jubiter.plugin;

import android.app.Activity;

import com.jubiter.sdk.JuBiterWallet;
import com.jubiter.sdk.proto.CommonProtos;

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
                generateMnemonic(call);
                break;
            }

            case "checkMnemonic": {
                checkMnemonic(call);
                break;
            }

            case "generateSeed": {
                generateSeed(call);
                break;
            }

            case "seedToMasterPrivateKey": {
                seedToMasterPrivateKey(call);
                break;
            }

            case "getDeviceInfo": {
                getDeviceInfo(call);
                break;
            }

            case "getDeviceCert": {
                getDeviceCert(call);
                break;
            }

            default:
                result.notImplemented();
                break;
        }
    }



    private byte[] generateMnemonic(MethodCall call) {
        CommonProtos.ENUM_MNEMONIC_STRENGTH strength = (CommonProtos.ENUM_MNEMONIC_STRENGTH) call.arguments;
        return JuBiterWallet.generateMnemonic(strength).toByteArray();
    }

    private int checkMnemonic(MethodCall call) {
        String mnemonic = (String) call.arguments;
        return JuBiterWallet.checkMnemonic(mnemonic);
    }

    private byte[] generateSeed(MethodCall call) {
        String mnemonic = call.argument("mnemonic");
        String passphrase = call.argument("passphrase");
        return JuBiterWallet.generateSeed(mnemonic, passphrase).toByteArray();
    }

    private byte[] seedToMasterPrivateKey(MethodCall call) {
        String seed = call.argument("seed");
        CommonProtos.CURVES curve = call.argument("curve");
        return JuBiterWallet.seedToMasterPrivateKey(seed, curve).toByteArray();
    }

    // todo： check
    private byte[] getDeviceInfo(MethodCall call) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.getDeviceInfo(deviceID).toByteArray();
    }

    private byte[] getDeviceCert(MethodCall call) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.getDeviceCert(deviceID).toByteArray();
    }

    private byte[] sendApdu(MethodCall call) {
        int deviceID = call.argument("deviceID");
        String apdu = call.argument("apdu");
        return JuBiterWallet.sendApdu(deviceID, apdu).toByteArray();
    }

    private boolean  isInitialize(MethodCall call) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.isInitialize(deviceID);
    }

    private boolean  isBootLoader(MethodCall call) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.isBootLoader(deviceID);
    }

    private byte[] setTimeout(MethodCall call) {
        int contextID = call.argument("contextID");
        int timeout = call.argument("timeout");
        return JuBiterWallet.setTimeout(contextID, timeout).toByteArray();
    }

    private byte[] enumApplets(MethodCall call) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.enumApplets(deviceID).toByteArray();
    }

    private byte[] enumSupportCoins(MethodCall call) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.enumSupportCoins(deviceID).toByteArray();
    }

    private byte[] getAppletVersion(MethodCall call) {
        int deviceID = call.argument("deviceID");
        String appletID = call.argument("appletID");
        return JuBiterWallet.getAppletVersion(deviceID, appletID).toByteArray();
    }

    private byte[] queryBattery(MethodCall call) {
        int deviceID = (int) call.arguments;
        return JuBiterWallet.queryBattery(deviceID).toByteArray();
    }

    private int clearContext(MethodCall call) {
        int contextID = (int) call.arguments;
        return JuBiterWallet.clearContext(contextID);
    }

    private int showVirtualPWD(MethodCall call) {
        int contextID = (int) call.arguments;
        return JuBiterWallet.showVirtualPWD(contextID);
    }

    private int cancelVirtualPWD(MethodCall call) {
        int contextID = (int) call.arguments;
        return JuBiterWallet.cancelVirtualPWD(contextID);
    }

    private byte[] verifyPIN(MethodCall call) {
        int contextID = call.argument("contextID");
        String PIN = call.argument("PIN");
        return JuBiterWallet.verifyPIN(contextID, PIN).toByteArray();
    }

    //************************************ 蓝牙接口 **************************************

    private int initDevice() {
        return JuBiterWallet.initDevice();
    }

}
