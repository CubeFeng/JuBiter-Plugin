///
//  Generated code. Do not modify.
//  source: Jub_Common.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/any.pb.dart' as $0;

import 'Jub_Common.pbenum.dart';

export 'Jub_Common.pbenum.dart';

class Bip44Path extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Bip44Path', package: const $pb.PackageName('JUB.Proto.Common'), createEmptyInstance: create)
    ..aOB(1, 'change')
    ..a<$fixnum.Int64>(2, 'addressIndex', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Bip44Path._() : super();
  factory Bip44Path() => create();
  factory Bip44Path.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Bip44Path.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Bip44Path clone() => Bip44Path()..mergeFromMessage(this);
  Bip44Path copyWith(void Function(Bip44Path) updates) => super.copyWith((message) => updates(message as Bip44Path));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Bip44Path create() => Bip44Path._();
  Bip44Path createEmptyInstance() => create();
  static $pb.PbList<Bip44Path> createRepeated() => $pb.PbList<Bip44Path>();
  @$core.pragma('dart2js:noInline')
  static Bip44Path getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bip44Path>(create);
  static Bip44Path _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get change => $_getBF(0);
  @$pb.TagNumber(1)
  set change($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChange() => $_has(0);
  @$pb.TagNumber(1)
  void clearChange() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get addressIndex => $_getI64(1);
  @$pb.TagNumber(2)
  set addressIndex($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddressIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddressIndex() => clearField(2);
}

class Slip48Path extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Slip48Path', package: const $pb.PackageName('JUB.Proto.Common'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'network', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<ENUM_GRAPHENE_ROLE>(2, 'role', $pb.PbFieldType.OE, defaultOrMaker: ENUM_GRAPHENE_ROLE.OWNER, valueOf: ENUM_GRAPHENE_ROLE.valueOf, enumValues: ENUM_GRAPHENE_ROLE.values)
    ..a<$fixnum.Int64>(3, 'addressIndex', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, 'keyIndex', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Slip48Path._() : super();
  factory Slip48Path() => create();
  factory Slip48Path.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Slip48Path.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Slip48Path clone() => Slip48Path()..mergeFromMessage(this);
  Slip48Path copyWith(void Function(Slip48Path) updates) => super.copyWith((message) => updates(message as Slip48Path));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Slip48Path create() => Slip48Path._();
  Slip48Path createEmptyInstance() => create();
  static $pb.PbList<Slip48Path> createRepeated() => $pb.PbList<Slip48Path>();
  @$core.pragma('dart2js:noInline')
  static Slip48Path getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Slip48Path>(create);
  static Slip48Path _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get network => $_getI64(0);
  @$pb.TagNumber(1)
  set network($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNetwork() => $_has(0);
  @$pb.TagNumber(1)
  void clearNetwork() => clearField(1);

  @$pb.TagNumber(2)
  ENUM_GRAPHENE_ROLE get role => $_getN(1);
  @$pb.TagNumber(2)
  set role(ENUM_GRAPHENE_ROLE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get addressIndex => $_getI64(2);
  @$pb.TagNumber(3)
  set addressIndex($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddressIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddressIndex() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get keyIndex => $_getI64(3);
  @$pb.TagNumber(4)
  set keyIndex($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasKeyIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearKeyIndex() => clearField(4);
}

class ContextCfg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextCfg', package: const $pb.PackageName('JUB.Proto.Common'), createEmptyInstance: create)
    ..aOS(1, 'mainPath')
    ..hasRequiredFields = false
  ;

  ContextCfg._() : super();
  factory ContextCfg() => create();
  factory ContextCfg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextCfg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextCfg clone() => ContextCfg()..mergeFromMessage(this);
  ContextCfg copyWith(void Function(ContextCfg) updates) => super.copyWith((message) => updates(message as ContextCfg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextCfg create() => ContextCfg._();
  ContextCfg createEmptyInstance() => create();
  static $pb.PbList<ContextCfg> createRepeated() => $pb.PbList<ContextCfg>();
  @$core.pragma('dart2js:noInline')
  static ContextCfg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextCfg>(create);
  static ContextCfg _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mainPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set mainPath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMainPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainPath() => clearField(1);
}

class DeviceInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeviceInfo', package: const $pb.PackageName('JUB.Proto.Common'), createEmptyInstance: create)
    ..aOS(1, 'sn')
    ..aOS(2, 'label')
    ..aOS(3, 'bleVersion')
    ..aOS(4, 'firmwareVersion')
    ..a<$core.int>(5, 'pinRetry', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, 'pinMaxRetry', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  DeviceInfo._() : super();
  factory DeviceInfo() => create();
  factory DeviceInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeviceInfo clone() => DeviceInfo()..mergeFromMessage(this);
  DeviceInfo copyWith(void Function(DeviceInfo) updates) => super.copyWith((message) => updates(message as DeviceInfo));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceInfo create() => DeviceInfo._();
  DeviceInfo createEmptyInstance() => create();
  static $pb.PbList<DeviceInfo> createRepeated() => $pb.PbList<DeviceInfo>();
  @$core.pragma('dart2js:noInline')
  static DeviceInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceInfo>(create);
  static DeviceInfo _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sn => $_getSZ(0);
  @$pb.TagNumber(1)
  set sn($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSn() => $_has(0);
  @$pb.TagNumber(1)
  void clearSn() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get bleVersion => $_getSZ(2);
  @$pb.TagNumber(3)
  set bleVersion($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBleVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearBleVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get firmwareVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set firmwareVersion($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFirmwareVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirmwareVersion() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get pinRetry => $_getIZ(4);
  @$pb.TagNumber(5)
  set pinRetry($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPinRetry() => $_has(4);
  @$pb.TagNumber(5)
  void clearPinRetry() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get pinMaxRetry => $_getIZ(5);
  @$pb.TagNumber(6)
  set pinMaxRetry($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPinMaxRetry() => $_has(5);
  @$pb.TagNumber(6)
  void clearPinMaxRetry() => clearField(6);
}

class ResultInt extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResultInt', package: const $pb.PackageName('JUB.Proto.Common'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'stateCode', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, 'value', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ResultInt._() : super();
  factory ResultInt() => create();
  factory ResultInt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultInt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResultInt clone() => ResultInt()..mergeFromMessage(this);
  ResultInt copyWith(void Function(ResultInt) updates) => super.copyWith((message) => updates(message as ResultInt));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResultInt create() => ResultInt._();
  ResultInt createEmptyInstance() => create();
  static $pb.PbList<ResultInt> createRepeated() => $pb.PbList<ResultInt>();
  @$core.pragma('dart2js:noInline')
  static ResultInt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultInt>(create);
  static ResultInt _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get stateCode => $_getI64(0);
  @$pb.TagNumber(1)
  set stateCode($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStateCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearStateCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get value => $_getIZ(1);
  @$pb.TagNumber(2)
  set value($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class ResultString extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResultString', package: const $pb.PackageName('JUB.Proto.Common'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'stateCode', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, 'value')
    ..hasRequiredFields = false
  ;

  ResultString._() : super();
  factory ResultString() => create();
  factory ResultString.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultString.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResultString clone() => ResultString()..mergeFromMessage(this);
  ResultString copyWith(void Function(ResultString) updates) => super.copyWith((message) => updates(message as ResultString));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResultString create() => ResultString._();
  ResultString createEmptyInstance() => create();
  static $pb.PbList<ResultString> createRepeated() => $pb.PbList<ResultString>();
  @$core.pragma('dart2js:noInline')
  static ResultString getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultString>(create);
  static ResultString _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get stateCode => $_getI64(0);
  @$pb.TagNumber(1)
  set stateCode($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStateCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearStateCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class ResultAny extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ResultAny', package: const $pb.PackageName('JUB.Proto.Common'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'stateCode', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<$0.Any>(2, 'value', $pb.PbFieldType.PM, subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  ResultAny._() : super();
  factory ResultAny() => create();
  factory ResultAny.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultAny.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ResultAny clone() => ResultAny()..mergeFromMessage(this);
  ResultAny copyWith(void Function(ResultAny) updates) => super.copyWith((message) => updates(message as ResultAny));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResultAny create() => ResultAny._();
  ResultAny createEmptyInstance() => create();
  static $pb.PbList<ResultAny> createRepeated() => $pb.PbList<ResultAny>();
  @$core.pragma('dart2js:noInline')
  static ResultAny getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultAny>(create);
  static ResultAny _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get stateCode => $_getI64(0);
  @$pb.TagNumber(1)
  set stateCode($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStateCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearStateCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$0.Any> get value => $_getList(1);
}

