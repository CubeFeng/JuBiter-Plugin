package com.jubiter.plugin;

import android.app.Activity;

import com.jubiter.sdk.JuBiterWallet;
import com.jubiter.sdk.proto.CommonProtos;

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

            case "generateMnemonic":
                generateMnemonic(CommonProtos.ENUM_MNEMONIC_STRENGTH.STRENGTH128);
                break;

            case "checkMnemonic":

                break;

            case "generateSeed":

                break;

            case "seedToMasterPrivateKey":

                break;

            default:
                result.notImplemented();
                break;
        }
    }


    private byte[] generateMnemonic(CommonProtos.ENUM_MNEMONIC_STRENGTH strength) {
        return JuBiterWallet.generateMnemonic(strength).toByteArray();
    }

    private int checkMnemonic(String mnemonic) {
        return JuBiterWallet.checkMnemonic(mnemonic);
    }

    private byte[] generateSeed(String mnemonic, String passphrase) {
        return JuBiterWallet.generateSeed(mnemonic, passphrase).toByteArray();
    }

    private byte[] seedToMasterPrivateKey(String seed, CommonProtos.CURVES curve) {
        return JuBiterWallet.seedToMasterPrivateKey(seed, curve).toByteArray();
    }

    // todo： check
    private byte[] getDeviceInfo(int deviceID) {
        return JuBiterWallet.getDeviceInfo(deviceID).toByteArray();
    }

    private byte[] getDeviceCert(int deviceID) {
        return JuBiterWallet.getDeviceCert(deviceID).toByteArray();
    }

    private byte[] sendApdu(int deviceID, String apdu) {
        return JuBiterWallet.sendApdu(deviceID, apdu).toByteArray();
    }


}
