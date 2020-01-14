///
//  Generated code. Do not modify.
//  source: Jub_Hcash.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Jub_Common.pb.dart' as $0;

class InputHC extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('InputHC', package: const $pb.PackageName('JUB.Proto.Hcash'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Bip44Path>(2, 'path', subBuilder: $0.Bip44Path.create)
    ..hasRequiredFields = false
  ;

  InputHC._() : super();
  factory InputHC() => create();
  factory InputHC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InputHC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  InputHC clone() => InputHC()..mergeFromMessage(this);
  InputHC copyWith(void Function(InputHC) updates) => super.copyWith((message) => updates(message as InputHC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InputHC create() => InputHC._();
  InputHC createEmptyInstance() => create();
  static $pb.PbList<InputHC> createRepeated() => $pb.PbList<InputHC>();
  @$core.pragma('dart2js:noInline')
  static InputHC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InputHC>(create);
  static InputHC _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $0.Bip44Path get path => $_getN(1);
  @$pb.TagNumber(2)
  set path($0.Bip44Path v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);
  @$pb.TagNumber(2)
  $0.Bip44Path ensurePath() => $_ensure(1);
}

class OutputHC extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OutputHC', package: const $pb.PackageName('JUB.Proto.Hcash'), createEmptyInstance: create)
    ..aOB(1, 'changeAddress')
    ..aOM<$0.Bip44Path>(2, 'path', subBuilder: $0.Bip44Path.create)
    ..hasRequiredFields = false
  ;

  OutputHC._() : super();
  factory OutputHC() => create();
  factory OutputHC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OutputHC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OutputHC clone() => OutputHC()..mergeFromMessage(this);
  OutputHC copyWith(void Function(OutputHC) updates) => super.copyWith((message) => updates(message as OutputHC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OutputHC create() => OutputHC._();
  OutputHC createEmptyInstance() => create();
  static $pb.PbList<OutputHC> createRepeated() => $pb.PbList<OutputHC>();
  @$core.pragma('dart2js:noInline')
  static OutputHC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OutputHC>(create);
  static OutputHC _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get changeAddress => $_getBF(0);
  @$pb.TagNumber(1)
  set changeAddress($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChangeAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearChangeAddress() => clearField(1);

  @$pb.TagNumber(2)
  $0.Bip44Path get path => $_getN(1);
  @$pb.TagNumber(2)
  set path($0.Bip44Path v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);
  @$pb.TagNumber(2)
  $0.Bip44Path ensurePath() => $_ensure(1);
}

class TransactionHC extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionHC', package: const $pb.PackageName('JUB.Proto.Hcash'), createEmptyInstance: create)
    ..a<$core.int>(1, 'version', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'locktime', $pb.PbFieldType.OU3)
    ..pc<InputHC>(3, 'inputs', $pb.PbFieldType.PM, subBuilder: InputHC.create)
    ..pc<OutputHC>(4, 'outputs', $pb.PbFieldType.PM, subBuilder: OutputHC.create)
    ..hasRequiredFields = false
  ;

  TransactionHC._() : super();
  factory TransactionHC() => create();
  factory TransactionHC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionHC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionHC clone() => TransactionHC()..mergeFromMessage(this);
  TransactionHC copyWith(void Function(TransactionHC) updates) => super.copyWith((message) => updates(message as TransactionHC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionHC create() => TransactionHC._();
  TransactionHC createEmptyInstance() => create();
  static $pb.PbList<TransactionHC> createRepeated() => $pb.PbList<TransactionHC>();
  @$core.pragma('dart2js:noInline')
  static TransactionHC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionHC>(create);
  static TransactionHC _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get locktime => $_getIZ(1);
  @$pb.TagNumber(2)
  set locktime($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocktime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocktime() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<InputHC> get inputs => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<OutputHC> get outputs => $_getList(3);
}

