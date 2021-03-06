import 'dart:ffi' as prefix0;
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:convert/convert.dart';

import 'package:flutter/services.dart';
import 'package:isolate/isolate.dart';
import 'package:jubiter_plugin/jubiter_plugin.dart';

import 'package:jubiter_plugin/gen/Jub_Bitcoin.pbserver.dart';
import 'package:jubiter_plugin/gen/Jub_Ethereum.pbserver.dart';
import 'package:jubiter_plugin/gen/Jub_Common.pbserver.dart';
import 'package:jubiter_plugin/gen/jubiterblue.pbserver.dart';
import 'package:jubiter_plugin/gen/google/protobuf/any.pb.dart';
import 'package:worker_manager/executor.dart';
import 'package:worker_manager/task.dart';

void main() async {
  // Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding
  // was initialized.错误修正
//  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Executor(isolatePoolSize: 2).warmUp();

  Timer(Duration(seconds: 10), () {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: FlatButton(
                onPressed: () {
                  runTest();
                },
                child: Text('测试'))
//          child: Text('Running on: $_platformVersion\n'),
            ),
      ),
    );
  }

  Future<String> runTest() async {
//    BTC_Software();
//     ETH_Software();
   bleTest();

//    Future<LoadBalancer> loadBalancer = LoadBalancer.create(2, IsolateRunner.spawn);
//    final lb = await loadBalancer;
//    String result = await lb.run(eth, 1);
//    eth(1);

//    final Task task = Task(function: eth, arg: 1);
//    Executor().addTask(task: task).listen((result) {
//      print('>>> result: $result');
//    });
  }

  void BTC_Software() async {
    ResultString mnemonicResult =
        await JuBiterWallet.generateMnemonic(ENUM_MNEMONIC_STRENGTH.STRENGTH128);
    LogUtils.d(
        ">>> generateMnemonic - rv:${mnemonicResult.stateCode} value:${mnemonicResult.value}");
    assert(mnemonicResult.stateCode == 0);

    int checkResult = await JuBiterWallet.checkMnemonic(mnemonicResult.value);
    LogUtils.d(">>> checkMnemonic - checkResult: $checkResult");
    assert(checkResult == 0);

    ResultString mnemonicSeed = await JuBiterWallet.generateSeed(mnemonicResult.value, "123");
    LogUtils.d(">>> generateSeed - rv:${mnemonicSeed.stateCode} value:${mnemonicSeed.value}");
    assert(mnemonicSeed.stateCode == 0);

    ResultString xPrikeyResult =
        await JuBiterWallet.seedToMasterPrivateKey(mnemonicSeed.value, CURVES.SECP256K1);
    LogUtils.d(
        ">>> seedToMasterPrivateKey - rv:${xPrikeyResult.stateCode} value:${xPrikeyResult.value}");
    assert(xPrikeyResult.stateCode == 0);

    ContextCfgBTC config = ContextCfgBTC.create();
    config.coinType = ENUM_COIN_TYPE_BTC.COINBTC;
    config.mainPath = "m/44\'/0\'/0\'";
    config.transType = ENUM_TRAN_STYPE_BTC.P2PKH;
    ResultInt contextResult = await JuBiterBitcoin.createContext_Software(config,
        'xpub6CAxrkiSbwkn4LayKD6qBcZg4tQvhHBH7TofQjNV9Lb3cB5u8owxdLGfc2bKoz2McoviAMXzWHwSaqc5Sm8C9SWMsnvuBw1bjEwtWsMZZFX');
    LogUtils.d(
        ">>> BTCCreateContext_Software - rv:${contextResult.stateCode} value:${contextResult.value}");
    assert(contextResult.stateCode == 0);

    ResultString mainHDNodeResult = await JuBiterBitcoin.getMainHDNode(contextResult.value);
    LogUtils.d(
        ">>> BTCGetMainHDNode - rv:${mainHDNodeResult.stateCode} value:${mainHDNodeResult.value}");
    assert(mainHDNodeResult.stateCode == 0);

    {
      Bip44Path bip32path = Bip44Path.create();
      bip32path.addressIndex = Int64(0);
      bip32path.change = false;
      ResultString hdNodeResult = await JuBiterBitcoin.getHDNode(contextResult.value, bip32path);
      LogUtils.d(">>> BTCGetHDNode - rv:${hdNodeResult.stateCode} value:${hdNodeResult.value}");
      assert(hdNodeResult.stateCode == 0);
    }

    {
      Bip44Path bip32path = Bip44Path.create();
      bip32path.addressIndex = Int64(0);
      bip32path.change = false;
      ResultString addressResult =
          await JuBiterBitcoin.getAddress(contextResult.value, bip32path, false);
      LogUtils.d(">>> BTCGetAddress - rv:${addressResult.stateCode} value:${addressResult.value}");
      assert(addressResult.stateCode == 0);
    }

    {
      // input
      Bip44Path bip32path_input1 = Bip44Path.create();
      bip32path_input1.change = false;
      bip32path_input1.addressIndex = Int64(0);

      InputBTC input_1 = InputBTC.create();
      input_1.path = bip32path_input1;
      input_1.preHash = '2a2e910f9fb2b04f7f1ddbfb4ab05785250c2b395f572ce591167c8451f0891e';
      input_1.amount = Int64(1200);
      input_1.preIndex = 0;

      Bip44Path bip32path_input2 = Bip44Path.create();
      bip32path_input2.change = false;
      bip32path_input2.addressIndex = Int64(0);

      InputBTC input_2 = InputBTC.create();
      input_2.path = bip32path_input2;
      input_2.preHash = '0fe4fafd846b18fe545bbc2dcb70ecb1290ec0de6219cd2299cd0a1561c8d583';
      input_2.amount = Int64(1000);
      input_2.preIndex = 0;

      // output
      StandardOutput out_1 = StandardOutput.create();
      out_1.address = '3MA1nkDJhthnC7DxoixmhLiXTyFo1eKJu7';
      out_1.amount = Int64(800);
      out_1.changeAddress = false;

      OutputBTC output_1 = OutputBTC.create();
      output_1.stdOutput = out_1;
      output_1.type = ENUM_SCRIPT_TYPE_BTC.SC_P2PKH;

      // change
      Bip44Path bip32path_output1 = Bip44Path.create();
      bip32path_output1.addressIndex = Int64(0);
      bip32path_output1.change = false;

      StandardOutput out_2 = StandardOutput.create();
      out_2.address = '1JpuFuiBfMzm99JzZG4rpZexxjortaH42t';
      out_2.amount = Int64(500);
      out_2.changeAddress = true;
      out_2.path = bip32path_output1;

      OutputBTC output_2 = OutputBTC.create();
      output_2.stdOutput = out_2;
      output_2.type = ENUM_SCRIPT_TYPE_BTC.SC_P2PKH;

      TransactionBTC txInfo = TransactionBTC.create();
      txInfo.version = 1;
      txInfo.locktime = 0;
      txInfo.inputs.add(input_1);
      txInfo.inputs.add(input_2);
      txInfo.outputs.add(output_1);
      txInfo.outputs.add(output_2);
      LogUtils.d('>>> txInfo:' + hex.encode(txInfo.writeToBuffer()));

      ResultString signResult = await JuBiterBitcoin.signTransaction(contextResult.value, txInfo);
      LogUtils.d(">>> BTCSignTransaction - rv:${signResult.stateCode} value:${signResult.value}");
      assert(signResult.stateCode == 0);
    }
  }

  void ETH_Software() async {
    // ResultString mnemonicResult =
    //     await JuBiterWallet.generateMnemonic(ENUM_MNEMONIC_STRENGTH.STRENGTH128);
    // LogUtils.d(
    //     ">>> generateMnemonic - rv:${mnemonicResult.stateCode} value:${mnemonicResult.value}");
    // assert(mnemonicResult.stateCode == 0);

    // int checkResult = await JuBiterWallet.checkMnemonic(mnemonicResult.value);
    // LogUtils.d(">>> checkMnemonic - checkResult: $checkResult");
    // assert(checkResult == 0);

    ResultString mnemonicSeed = await JuBiterWallet.generateSeed("gauge hole clog property soccer idea cycle stadium utility slice hold chief", '');
    LogUtils.d(">>> generateSeed - rv:${mnemonicSeed.stateCode} value:${mnemonicSeed.value}");
    assert(mnemonicSeed.stateCode == 0);

    ResultString xPrikeyResult =
        await JuBiterWallet.seedToMasterPrivateKey(mnemonicSeed.value, CURVES.SECP256K1);
    LogUtils.d(
        ">>> seedToMasterPrivateKey - rv:${xPrikeyResult.stateCode} value:${xPrikeyResult.value}");
    assert(xPrikeyResult.stateCode == 0);

    ContextCfgETH config = ContextCfgETH.create();
    config.mainPath = "m/44\'/60\'/0\'";
    ResultInt contextResult =
        await JuBiterEthereum.createContext_Software(config, xPrikeyResult.value);
    LogUtils.d(
        ">>> ETHCreateContext_Software - rv:${contextResult.stateCode} value:${contextResult.value}");
    assert(contextResult.stateCode == 0);

    ResultString mainHDNodeResult =
        await JuBiterEthereum.getMainHDNode(contextResult.value, ENUM_PUB_FORMAT.HEX);
    LogUtils.d(
        ">>> ETHGetMainHDNode - rv:${mainHDNodeResult.stateCode} value:${mainHDNodeResult.value}");
    assert(mainHDNodeResult.stateCode == 0);

    {
      Bip44Path bip32path = Bip44Path.create();
      bip32path.addressIndex = Int64(0);
      bip32path.change = false;
      ResultString hdNodeResult =
          await JuBiterEthereum.getHDNode(contextResult.value, ENUM_PUB_FORMAT.HEX, bip32path);
      LogUtils.d(">>> ETHGetHDNode - rv:${hdNodeResult.stateCode} value:${hdNodeResult.value}");
      assert(hdNodeResult.stateCode == 0);
    }

    {
      Bip44Path bip32path = Bip44Path.create();
      bip32path.addressIndex = Int64(0);
      bip32path.change = false;
      ResultString addressResult =
          await JuBiterEthereum.getAddress(contextResult.value, bip32path, false);
      LogUtils.d(">>> ETHGetAddress - rv:${addressResult.stateCode} value:${addressResult.value}");
      assert(addressResult.stateCode == 0);
    }

//    {
//      ResultInt verifyResult = await JuBiterWallet.verifyPIN(contextResult.value, "");
//      LogUtils.d(
//          ">>> verifyPIN - rv:${verifyResult.stateCode} value:${verifyResult.value}");
//      assert(verifyResult.stateCode == 0);
//    }

    {
      Bip44Path bip32path = Bip44Path.create();
      bip32path.change = false;
      bip32path.addressIndex = Int64(0);

      TransactionETH txInfo = TransactionETH.create();
      txInfo.path = bip32path;
      txInfo.nonce = 13;
      txInfo.gasLimit = 310000;
      txInfo.gasPriceInWei = '10000000000';
      txInfo.to = '0xef31DEc147DCDcd64F6a0ABFA7D441B62A216BC9';
      txInfo.valueInWei = '500000000000000';
      txInfo.input = '4A75626974657257616C6C6574';

      ResultString signResult = await JuBiterEthereum.signTransaction(contextResult.value, txInfo);
      print('>>> result length: ${signResult.value.length}');
      LogUtils.d(">>> ETHSignTransaction - rv:${signResult.stateCode} value:${signResult.value}");
      assert(signResult.stateCode == 0);
    }

    {
      // ResultString signResult = await JuBiterEthereum.buildERC20Abi(
      //     contextResult.value, 'BTM', 1, '', '0xef31DEc147DCDcd64F6a0ABFA7D441B62A216BC9', '1000000'
      //     '0');
      // LogUtils.d(">>> buildERC20Abi - rv:${signResult.stateCode} value:${signResult.value}");
    }
  }

  Future<String> bleTest() {
    JuBiterWallet.initDevice().then((value) {
      LogUtils.d('>>> init callback: $value');
      JuBiterWallet.startScan(new Duration(seconds: 10)).listen((scanResult) {
        LogUtils.d('main >>> ${scanResult.device.remoteId} ${scanResult.device.name}');
      }, onDone: () {
        LogUtils.d('main >>> scan onDone');
      }, onError: (Object event) {
        LogUtils.d('main >>> scan onError');
      });

      // 模拟扫描连接过程
      Timer(new Duration(seconds: 5), () {
        JuBiterWallet.stopScan();

        BluetoothDevice device = new BluetoothDevice()
          ..remoteId = 'DD:5F:13:AA:38:39'
          ..name = 'DD:5F:13:AA:38:39'
          ..type = BluetoothDevice_Type.LE;

//      JuBiterWallet.connectDeviceAsync(device, Duration(seconds: 10)).listen(
//          (bluetoothDeviceState) {
//        LogUtils.d('main >>> connectDeviceAsync listen : ${bluetoothDeviceState.toString()}');
//      }, onError: (Object event) {
//        LogUtils.d('main >>> connectDeviceAsync onError');
//      }, onDone: () {
//        LogUtils.d('main >>> connectDeviceAsync onDone');
//      });

        JuBiterWallet.connect(device, Duration(seconds: 10), (deviceStateResponse) {
          LogUtils.d('>>> connect callback: ${deviceStateResponse.state.toString()}');
          LogUtils.d('>>> deviceID: ${deviceStateResponse.deviceID}');

          JuBiterWallet.getDeviceInfo(deviceStateResponse.deviceID).then((resultAny) {
            List<Any> detail = resultAny.value;
            for (var data in detail) {
              DeviceInfo info = DeviceInfo.create();
              data.unpackInto(info);
              LogUtils.d('main >>> deviceInfo: ${info.toString()}');
            }

            JuBiterWallet.getDeviceCert(deviceStateResponse.deviceID).then((value) {
              LogUtils.d('main >>> deviceCert: ${value.value}');
            });
          });
        }, (error) {
          LogUtils.d('>>> connect callback error: ${error}');
        });
      });
    }, onError: (error) {
      LogUtils.d('>>> init error: ${error}');
    });
  }
}

Future<String> eth(var i) async {
  ResultString mnemonicResult =
      await JuBiterWallet.generateMnemonic(ENUM_MNEMONIC_STRENGTH.STRENGTH128);
  LogUtils.d(">>> generateMnemonic - rv:${mnemonicResult.stateCode} value:${mnemonicResult.value}");
  return '';
//    assert(mnemonicResult.stateCode == 0);
}
