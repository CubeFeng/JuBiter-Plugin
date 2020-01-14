///
//  Generated code. Do not modify.
//  source: Jub_Bitcoin.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ENUM_COIN_TYPE_BTC extends $pb.ProtobufEnum {
  static const ENUM_COIN_TYPE_BTC COINBTC = ENUM_COIN_TYPE_BTC._(0, 'COINBTC');
  static const ENUM_COIN_TYPE_BTC COINBCH = ENUM_COIN_TYPE_BTC._(1, 'COINBCH');
  static const ENUM_COIN_TYPE_BTC COINLTC = ENUM_COIN_TYPE_BTC._(2, 'COINLTC');
  static const ENUM_COIN_TYPE_BTC COINUSDT = ENUM_COIN_TYPE_BTC._(3, 'COINUSDT');
  static const ENUM_COIN_TYPE_BTC COINDASH = ENUM_COIN_TYPE_BTC._(4, 'COINDASH');
  static const ENUM_COIN_TYPE_BTC COINQTUM = ENUM_COIN_TYPE_BTC._(5, 'COINQTUM');

  static const $core.List<ENUM_COIN_TYPE_BTC> values = <ENUM_COIN_TYPE_BTC> [
    COINBTC,
    COINBCH,
    COINLTC,
    COINUSDT,
    COINDASH,
    COINQTUM,
  ];

  static final $core.Map<$core.int, ENUM_COIN_TYPE_BTC> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ENUM_COIN_TYPE_BTC valueOf($core.int value) => _byValue[value];

  const ENUM_COIN_TYPE_BTC._($core.int v, $core.String n) : super(v, n);
}

class ENUM_TRAN_STYPE_BTC extends $pb.ProtobufEnum {
  static const ENUM_TRAN_STYPE_BTC P2PKH = ENUM_TRAN_STYPE_BTC._(0, 'P2PKH');
  static const ENUM_TRAN_STYPE_BTC P2SH_P2WPKH = ENUM_TRAN_STYPE_BTC._(1, 'P2SH_P2WPKH');
  static const ENUM_TRAN_STYPE_BTC P2SH_MULTISIG = ENUM_TRAN_STYPE_BTC._(2, 'P2SH_MULTISIG');
  static const ENUM_TRAN_STYPE_BTC P2PK = ENUM_TRAN_STYPE_BTC._(3, 'P2PK');

  static const $core.List<ENUM_TRAN_STYPE_BTC> values = <ENUM_TRAN_STYPE_BTC> [
    P2PKH,
    P2SH_P2WPKH,
    P2SH_MULTISIG,
    P2PK,
  ];

  static final $core.Map<$core.int, ENUM_TRAN_STYPE_BTC> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ENUM_TRAN_STYPE_BTC valueOf($core.int value) => _byValue[value];

  const ENUM_TRAN_STYPE_BTC._($core.int v, $core.String n) : super(v, n);
}

class BTC_UNIT_TYPE extends $pb.ProtobufEnum {
  static const BTC_UNIT_TYPE BTC = BTC_UNIT_TYPE._(0, 'BTC');
  static const BTC_UNIT_TYPE cBTC = BTC_UNIT_TYPE._(1, 'cBTC');
  static const BTC_UNIT_TYPE mBTC = BTC_UNIT_TYPE._(2, 'mBTC');
  static const BTC_UNIT_TYPE uBTC = BTC_UNIT_TYPE._(3, 'uBTC');
  static const BTC_UNIT_TYPE Satoshi = BTC_UNIT_TYPE._(4, 'Satoshi');

  static const $core.List<BTC_UNIT_TYPE> values = <BTC_UNIT_TYPE> [
    BTC,
    cBTC,
    mBTC,
    uBTC,
    Satoshi,
  ];

  static final $core.Map<$core.int, BTC_UNIT_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BTC_UNIT_TYPE valueOf($core.int value) => _byValue[value];

  const BTC_UNIT_TYPE._($core.int v, $core.String n) : super(v, n);
}

class ENUM_SCRIPT_TYPE_BTC extends $pb.ProtobufEnum {
  static const ENUM_SCRIPT_TYPE_BTC SC_P2PKH = ENUM_SCRIPT_TYPE_BTC._(0, 'SC_P2PKH');
  static const ENUM_SCRIPT_TYPE_BTC SC_RETURN0 = ENUM_SCRIPT_TYPE_BTC._(1, 'SC_RETURN0');
  static const ENUM_SCRIPT_TYPE_BTC SC_QRC20 = ENUM_SCRIPT_TYPE_BTC._(3, 'SC_QRC20');

  static const $core.List<ENUM_SCRIPT_TYPE_BTC> values = <ENUM_SCRIPT_TYPE_BTC> [
    SC_P2PKH,
    SC_RETURN0,
    SC_QRC20,
  ];

  static final $core.Map<$core.int, ENUM_SCRIPT_TYPE_BTC> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ENUM_SCRIPT_TYPE_BTC valueOf($core.int value) => _byValue[value];

  const ENUM_SCRIPT_TYPE_BTC._($core.int v, $core.String n) : super(v, n);
}

