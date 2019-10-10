///
//  Generated code. Do not modify.
//  source: Jub_Ethereum.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;


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

