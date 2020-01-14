///
//  Generated code. Do not modify.
//  source: Jub_Bitcoin.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'Jub_Common.pb.dart' as $0;

import 'Jub_Bitcoin.pbenum.dart';

export 'Jub_Bitcoin.pbenum.dart';

class ContextCfgBTC extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ContextCfgBTC', package: const $pb.PackageName('JUB.Proto.Bitcoin'), createEmptyInstance: create)
    ..aOS(1, 'mainPath')
    ..e<ENUM_COIN_TYPE_BTC>(2, 'coinType', $pb.PbFieldType.OE, defaultOrMaker: ENUM_COIN_TYPE_BTC.COINBTC, valueOf: ENUM_COIN_TYPE_BTC.valueOf, enumValues: ENUM_COIN_TYPE_BTC.values)
    ..e<ENUM_TRAN_STYPE_BTC>(3, 'transType', $pb.PbFieldType.OE, defaultOrMaker: ENUM_TRAN_STYPE_BTC.P2PKH, valueOf: ENUM_TRAN_STYPE_BTC.valueOf, enumValues: ENUM_TRAN_STYPE_BTC.values)
    ..hasRequiredFields = false
  ;

  ContextCfgBTC._() : super();
  factory ContextCfgBTC() => create();
  factory ContextCfgBTC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContextCfgBTC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ContextCfgBTC clone() => ContextCfgBTC()..mergeFromMessage(this);
  ContextCfgBTC copyWith(void Function(ContextCfgBTC) updates) => super.copyWith((message) => updates(message as ContextCfgBTC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContextCfgBTC create() => ContextCfgBTC._();
  ContextCfgBTC createEmptyInstance() => create();
  static $pb.PbList<ContextCfgBTC> createRepeated() => $pb.PbList<ContextCfgBTC>();
  @$core.pragma('dart2js:noInline')
  static ContextCfgBTC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContextCfgBTC>(create);
  static ContextCfgBTC _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mainPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set mainPath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMainPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainPath() => clearField(1);

  @$pb.TagNumber(2)
  ENUM_COIN_TYPE_BTC get coinType => $_getN(1);
  @$pb.TagNumber(2)
  set coinType(ENUM_COIN_TYPE_BTC v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCoinType() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoinType() => clearField(2);

  @$pb.TagNumber(3)
  ENUM_TRAN_STYPE_BTC get transType => $_getN(2);
  @$pb.TagNumber(3)
  set transType(ENUM_TRAN_STYPE_BTC v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransType() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransType() => clearField(3);
}

class InputBTC extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('InputBTC', package: const $pb.PackageName('JUB.Proto.Bitcoin'), createEmptyInstance: create)
    ..aOS(1, 'preHash')
    ..a<$core.int>(2, 'preIndex', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Bip44Path>(4, 'path', subBuilder: $0.Bip44Path.create)
    ..hasRequiredFields = false
  ;

  InputBTC._() : super();
  factory InputBTC() => create();
  factory InputBTC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InputBTC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  InputBTC clone() => InputBTC()..mergeFromMessage(this);
  InputBTC copyWith(void Function(InputBTC) updates) => super.copyWith((message) => updates(message as InputBTC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InputBTC create() => InputBTC._();
  InputBTC createEmptyInstance() => create();
  static $pb.PbList<InputBTC> createRepeated() => $pb.PbList<InputBTC>();
  @$core.pragma('dart2js:noInline')
  static InputBTC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InputBTC>(create);
  static InputBTC _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get preHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set preHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPreHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearPreHash() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get preIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set preIndex($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPreIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreIndex() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $0.Bip44Path get path => $_getN(3);
  @$pb.TagNumber(4)
  set path($0.Bip44Path v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPath() => $_has(3);
  @$pb.TagNumber(4)
  void clearPath() => clearField(4);
  @$pb.TagNumber(4)
  $0.Bip44Path ensurePath() => $_ensure(3);
}

class StandardOutput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StandardOutput', package: const $pb.PackageName('JUB.Proto.Bitcoin'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..a<$fixnum.Int64>(2, 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(3, 'changeAddress')
    ..aOM<$0.Bip44Path>(4, 'path', subBuilder: $0.Bip44Path.create)
    ..hasRequiredFields = false
  ;

  StandardOutput._() : super();
  factory StandardOutput() => create();
  factory StandardOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StandardOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StandardOutput clone() => StandardOutput()..mergeFromMessage(this);
  StandardOutput copyWith(void Function(StandardOutput) updates) => super.copyWith((message) => updates(message as StandardOutput));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StandardOutput create() => StandardOutput._();
  StandardOutput createEmptyInstance() => create();
  static $pb.PbList<StandardOutput> createRepeated() => $pb.PbList<StandardOutput>();
  @$core.pragma('dart2js:noInline')
  static StandardOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StandardOutput>(create);
  static StandardOutput _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get changeAddress => $_getBF(2);
  @$pb.TagNumber(3)
  set changeAddress($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChangeAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearChangeAddress() => clearField(3);

  @$pb.TagNumber(4)
  $0.Bip44Path get path => $_getN(3);
  @$pb.TagNumber(4)
  set path($0.Bip44Path v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPath() => $_has(3);
  @$pb.TagNumber(4)
  void clearPath() => clearField(4);
  @$pb.TagNumber(4)
  $0.Bip44Path ensurePath() => $_ensure(3);
}

class Return0Output extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Return0Output', package: const $pb.PackageName('JUB.Proto.Bitcoin'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, 'data')
    ..hasRequiredFields = false
  ;

  Return0Output._() : super();
  factory Return0Output() => create();
  factory Return0Output.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Return0Output.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Return0Output clone() => Return0Output()..mergeFromMessage(this);
  Return0Output copyWith(void Function(Return0Output) updates) => super.copyWith((message) => updates(message as Return0Output));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Return0Output create() => Return0Output._();
  Return0Output createEmptyInstance() => create();
  static $pb.PbList<Return0Output> createRepeated() => $pb.PbList<Return0Output>();
  @$core.pragma('dart2js:noInline')
  static Return0Output getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Return0Output>(create);
  static Return0Output _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(2)
  set data($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

class QRC20Output extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('QRC20Output', package: const $pb.PackageName('JUB.Proto.Bitcoin'), createEmptyInstance: create)
    ..aOS(1, 'data')
    ..hasRequiredFields = false
  ;

  QRC20Output._() : super();
  factory QRC20Output() => create();
  factory QRC20Output.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QRC20Output.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  QRC20Output clone() => QRC20Output()..mergeFromMessage(this);
  QRC20Output copyWith(void Function(QRC20Output) updates) => super.copyWith((message) => updates(message as QRC20Output));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QRC20Output create() => QRC20Output._();
  QRC20Output createEmptyInstance() => create();
  static $pb.PbList<QRC20Output> createRepeated() => $pb.PbList<QRC20Output>();
  @$core.pragma('dart2js:noInline')
  static QRC20Output getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QRC20Output>(create);
  static QRC20Output _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get data => $_getSZ(0);
  @$pb.TagNumber(1)
  set data($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

enum OutputBTC_Output {
  stdOutput, 
  return0Output, 
  qrc20Output, 
  notSet
}

class OutputBTC extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, OutputBTC_Output> _OutputBTC_OutputByTag = {
    2 : OutputBTC_Output.stdOutput,
    3 : OutputBTC_Output.return0Output,
    4 : OutputBTC_Output.qrc20Output,
    0 : OutputBTC_Output.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('OutputBTC', package: const $pb.PackageName('JUB.Proto.Bitcoin'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..e<ENUM_SCRIPT_TYPE_BTC>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: ENUM_SCRIPT_TYPE_BTC.SC_P2PKH, valueOf: ENUM_SCRIPT_TYPE_BTC.valueOf, enumValues: ENUM_SCRIPT_TYPE_BTC.values)
    ..aOM<StandardOutput>(2, 'stdOutput', subBuilder: StandardOutput.create)
    ..aOM<Return0Output>(3, 'return0Output', subBuilder: Return0Output.create)
    ..aOM<QRC20Output>(4, 'qrc20Output', subBuilder: QRC20Output.create)
    ..hasRequiredFields = false
  ;

  OutputBTC._() : super();
  factory OutputBTC() => create();
  factory OutputBTC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OutputBTC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  OutputBTC clone() => OutputBTC()..mergeFromMessage(this);
  OutputBTC copyWith(void Function(OutputBTC) updates) => super.copyWith((message) => updates(message as OutputBTC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OutputBTC create() => OutputBTC._();
  OutputBTC createEmptyInstance() => create();
  static $pb.PbList<OutputBTC> createRepeated() => $pb.PbList<OutputBTC>();
  @$core.pragma('dart2js:noInline')
  static OutputBTC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OutputBTC>(create);
  static OutputBTC _defaultInstance;

  OutputBTC_Output whichOutput() => _OutputBTC_OutputByTag[$_whichOneof(0)];
  void clearOutput() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ENUM_SCRIPT_TYPE_BTC get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ENUM_SCRIPT_TYPE_BTC v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  StandardOutput get stdOutput => $_getN(1);
  @$pb.TagNumber(2)
  set stdOutput(StandardOutput v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStdOutput() => $_has(1);
  @$pb.TagNumber(2)
  void clearStdOutput() => clearField(2);
  @$pb.TagNumber(2)
  StandardOutput ensureStdOutput() => $_ensure(1);

  @$pb.TagNumber(3)
  Return0Output get return0Output => $_getN(2);
  @$pb.TagNumber(3)
  set return0Output(Return0Output v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasReturn0Output() => $_has(2);
  @$pb.TagNumber(3)
  void clearReturn0Output() => clearField(3);
  @$pb.TagNumber(3)
  Return0Output ensureReturn0Output() => $_ensure(2);

  @$pb.TagNumber(4)
  QRC20Output get qrc20Output => $_getN(3);
  @$pb.TagNumber(4)
  set qrc20Output(QRC20Output v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasQrc20Output() => $_has(3);
  @$pb.TagNumber(4)
  void clearQrc20Output() => clearField(4);
  @$pb.TagNumber(4)
  QRC20Output ensureQrc20Output() => $_ensure(3);
}

class TransactionBTC extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionBTC', package: const $pb.PackageName('JUB.Proto.Bitcoin'), createEmptyInstance: create)
    ..a<$core.int>(1, 'version', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'locktime', $pb.PbFieldType.OU3)
    ..pc<InputBTC>(3, 'inputs', $pb.PbFieldType.PM, subBuilder: InputBTC.create)
    ..pc<OutputBTC>(4, 'outputs', $pb.PbFieldType.PM, subBuilder: OutputBTC.create)
    ..hasRequiredFields = false
  ;

  TransactionBTC._() : super();
  factory TransactionBTC() => create();
  factory TransactionBTC.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionBTC.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionBTC clone() => TransactionBTC()..mergeFromMessage(this);
  TransactionBTC copyWith(void Function(TransactionBTC) updates) => super.copyWith((message) => updates(message as TransactionBTC));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionBTC create() => TransactionBTC._();
  TransactionBTC createEmptyInstance() => create();
  static $pb.PbList<TransactionBTC> createRepeated() => $pb.PbList<TransactionBTC>();
  @$core.pragma('dart2js:noInline')
  static TransactionBTC getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionBTC>(create);
  static TransactionBTC _defaultInstance;

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
  $core.List<InputBTC> get inputs => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<OutputBTC> get outputs => $_getList(3);
}

