///
//  Generated code. Do not modify.
//  source: Jub_Common.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ENUM_GRAPHENE_ROLE extends $pb.ProtobufEnum {
  static const ENUM_GRAPHENE_ROLE OWNER = ENUM_GRAPHENE_ROLE._(0, 'OWNER');
  static const ENUM_GRAPHENE_ROLE ACTIVE = ENUM_GRAPHENE_ROLE._(1, 'ACTIVE');

  static const $core.List<ENUM_GRAPHENE_ROLE> values = <ENUM_GRAPHENE_ROLE> [
    OWNER,
    ACTIVE,
  ];

  static final $core.Map<$core.int, ENUM_GRAPHENE_ROLE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ENUM_GRAPHENE_ROLE valueOf($core.int value) => _byValue[value];

  const ENUM_GRAPHENE_ROLE._($core.int v, $core.String n) : super(v, n);
}

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
  static const CURVES SECP256K1 = CURVES._(0, 'SECP256K1');
  static const CURVES ED25519 = CURVES._(1, 'ED25519');
  static const CURVES NIST256P1 = CURVES._(2, 'NIST256P1');

  static const $core.List<CURVES> values = <CURVES> [
    SECP256K1,
    ED25519,
    NIST256P1,
  ];

  static final $core.Map<$core.int, CURVES> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CURVES valueOf($core.int value) => _byValue[value];

  const CURVES._($core.int v, $core.String n) : super(v, n);
}

class ENUM_PUB_FORMAT extends $pb.ProtobufEnum {
  static const ENUM_PUB_FORMAT HEX = ENUM_PUB_FORMAT._(0, 'HEX');
  static const ENUM_PUB_FORMAT XPUB = ENUM_PUB_FORMAT._(1, 'XPUB');

  static const $core.List<ENUM_PUB_FORMAT> values = <ENUM_PUB_FORMAT> [
    HEX,
    XPUB,
  ];

  static final $core.Map<$core.int, ENUM_PUB_FORMAT> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ENUM_PUB_FORMAT valueOf($core.int value) => _byValue[value];

  const ENUM_PUB_FORMAT._($core.int v, $core.String n) : super(v, n);
}

