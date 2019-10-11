import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:jubiter_plugin/jubiter_plugin.dart';

import 'package:jubiter_plugin/gen/Jub_Bitcoin.pb.dart';
import 'package:jubiter_plugin/gen/Jub_Bitcoin.pbenum.dart';
import 'package:jubiter_plugin/gen/Jub_Bitcoin.pbjson.dart';
import 'package:jubiter_plugin/gen/Jub_Ethereum.pb.dart';
import 'package:jubiter_plugin/gen/Jub_Ethereum.pbenum.dart';
import 'package:jubiter_plugin/gen/Jub_Ethereum.pbjson.dart';
import 'package:jubiter_plugin/gen/Jub_Ethereum.pbserver.dart';

import 'package:jubiter_plugin/gen/Jub_Common.pb.dart';
import 'package:jubiter_plugin/gen/Jub_Common.pbenum.dart';
import 'package:jubiter_plugin/gen/Jub_Common.pbjson.dart';
import 'package:jubiter_plugin/gen/Jub_Common.pbserver.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await runTest();
//      platformVersion = await JuBiterPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }

  Future<String> runTest() async {
    BTC_Software();
    ETH_Software();
  }

  void BTC_Software() async {

    ResultString mnemonicResult = await JuBiterWallet.generateMnemonic(
        ENUM_MNEMONIC_STRENGTH.STRENGTH128);
    LogUtils.d(
        ">>> generateMnemonic - rv:${mnemonicResult.stateCode} value:${mnemonicResult.value}");
    assert(mnemonicResult.stateCode == 0);

    int checkResult = await JuBiterWallet.checkMnemonic(mnemonicResult.value);
    LogUtils.d(">>> checkMnemonic - checkResult: $checkResult");
    assert(checkResult == 0);

    ResultString mnemonicSeed =
        await JuBiterWallet.generateSeed(mnemonicResult.value, "123");
    LogUtils.d(
        ">>> generateSeed - rv:${mnemonicSeed.stateCode} value:${mnemonicSeed.value}");
    assert(mnemonicSeed.stateCode == 0);

    ResultString xPrikeyResult = await JuBiterWallet.seedToMasterPrivateKey(
        mnemonicSeed.value, CURVES.secp256k1);
    LogUtils.d(
        ">>> seedToMasterPrivateKey - rv:${xPrikeyResult.stateCode} value:${xPrikeyResult.value}");
    assert(xPrikeyResult.stateCode == 0);

    ContextCfgBTC config = ContextCfgBTC.create();
    config.coinType = ENUM_COIN_TYPE_BTC.COINBTC;
    config.mainPath = "m/44\'/0\'/0\'";
    config.transType = ENUM_TRAN_STYPE_BTC.p2pkh;
    ResultInt contextResult = await JuBiterPlugin.BTCCreateContext_Software(
        config,
        'xpub6CAxrkiSbwkn4LayKD6qBcZg4tQvhHBH7TofQjNV9Lb3cB5u8owxdLGfc2bKoz2McoviAMXzWHwSaqc5Sm8C9SWMsnvuBw1bjEwtWsMZZFX');
    LogUtils.d(
        ">>> BTCCreateContext_Software - rv:${contextResult.stateCode} value:${contextResult.value}");
    assert(contextResult.stateCode == 0);

    ResultString mainHDNodeResult = await JuBiterPlugin.BTCGetMainHDNode(contextResult.value);
    LogUtils.d(
        ">>> BTCGetMainHDNode - rv:${mainHDNodeResult.stateCode} value:${mainHDNodeResult.value}");
    assert(mainHDNodeResult.stateCode == 0);

    {
      Bip32Path bip32path = Bip32Path.create();
      bip32path.addressIndex = Int64(0);
      bip32path.change = false;
      ResultString hdNodeResult = await JuBiterPlugin.BTCGetHDNode(
          contextResult.value, bip32path);
      LogUtils.d(
          ">>> BTCGetHDNode - rv:${hdNodeResult.stateCode} value:${hdNodeResult
              .value}");
      assert(hdNodeResult.stateCode == 0);
    }

    {
      Bip32Path bip32path = Bip32Path.create();
      bip32path.addressIndex = Int64(0);
      bip32path.change = false;
      ResultString addressResult = await JuBiterPlugin.BTCGetAddress(
          contextResult.value, bip32path, false);
      LogUtils.d(
          ">>> BTCGetAddress - rv:${addressResult.stateCode} value:${addressResult.value}");
      assert(addressResult.stateCode == 0);
    }

    {

    }

  }

  void ETH_Software() {

  }
}
