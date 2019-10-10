///
//  Generated code. Do not modify.
//  source: Jub_Common.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;


class ENUM_MNEMONIC_STRENGTH extends $pb.ProtobufEnum {
  static const ENUM_MNEMONIC_STRENGTH STRENGTH128 = ENUM_MNEMONIC_STRENGTH._(0, 'STRENGTH128');
  static const ENUM_MNEMONIC_STRENGTH STRENGTH192 = ENUM_MNEMONIC_STRENGTH._(1, 'STRENGTH192');
  static const ENUM_MNEMONIC_STRENGTH STRENGTH256 = ENUM_MNEMONIC_STRENGTH._(2, 'STRENGTH256');

  static const $core.List<ENUM_MNEMONIC_STRENGTH> values = <ENUM_MNEMONIC_STRENGTH> [
    STRENGTH128,
    STRENGTH192,
    STRENGTH256,
  ];

  static final $core.Map<$core.int, ENUM_MNEMONIC_STRENGTH> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ENUM_MNEMONIC_STRENGTH valueOf($core.int value) => _byValue[value];

  const ENUM_MNEMONIC_STRENGTH._($core.int v, $core.String n) : super(v, n);
}

class CURVES extends $pb.ProtobufEnum {
  static const CURVES secp256k1 = CURVES._(0, 'secp256k1');
  static const CURVES ed25519 = CURVES._(1, 'ed25519');
  static const CURVES nist256p1 = CURVES._(2, 'nist256p1');

  static const $core.List<CURVES> values = <CURVES> [
    secp256k1,
    ed25519,
    nist256p1,
  ];

  static final $core.Map<$core.int, CURVES> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CURVES valueOf($core.int value) => _byValue[value];

  const CURVES._($core.int v, $core.String n) : super(v, n);
}

