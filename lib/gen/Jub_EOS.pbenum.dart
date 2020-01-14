///
//  Generated code. Do not modify.
//  source: Jub_EOS.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ENUM_EOS_ACTION_TYPE extends $pb.ProtobufEnum {
  static const ENUM_EOS_ACTION_TYPE XFER = ENUM_EOS_ACTION_TYPE._(0, 'XFER');
  static const ENUM_EOS_ACTION_TYPE DELE = ENUM_EOS_ACTION_TYPE._(1, 'DELE');
  static const ENUM_EOS_ACTION_TYPE UNDELE = ENUM_EOS_ACTION_TYPE._(2, 'UNDELE');
  static const ENUM_EOS_ACTION_TYPE BUYRAM = ENUM_EOS_ACTION_TYPE._(3, 'BUYRAM');
  static const ENUM_EOS_ACTION_TYPE SELLRAM = ENUM_EOS_ACTION_TYPE._(4, 'SELLRAM');

  static const $core.List<ENUM_EOS_ACTION_TYPE> values = <ENUM_EOS_ACTION_TYPE> [
    XFER,
    DELE,
    UNDELE,
    BUYRAM,
    SELLRAM,
  ];

  static final $core.Map<$core.int, ENUM_EOS_ACTION_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ENUM_EOS_ACTION_TYPE valueOf($core.int value) => _byValue[value];

  const ENUM_EOS_ACTION_TYPE._($core.int v, $core.String n) : super(v, n);
}

