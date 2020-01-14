///
//  Generated code. Do not modify.
//  source: Jub_EOS.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Jub_EOS.pbenum.dart';

export 'Jub_EOS.pbenum.dart';

class TransferAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransferAction', package: const $pb.PackageName('JUB.Proto.EOS'), createEmptyInstance: create)
    ..aOS(1, 'from')
    ..aOS(2, 'to')
    ..aOS(3, 'asset')
    ..aOS(4, 'memo')
    ..hasRequiredFields = false
  ;

  TransferAction._() : super();
  factory TransferAction() => create();
  factory TransferAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransferAction clone() => TransferAction()..mergeFromMessage(this);
  TransferAction copyWith(void Function(TransferAction) updates) => super.copyWith((message) => updates(message as TransferAction));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferAction create() => TransferAction._();
  TransferAction createEmptyInstance() => create();
  static $pb.PbList<TransferAction> createRepeated() => $pb.PbList<TransferAction>();
  @$core.pragma('dart2js:noInline')
  static TransferAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferAction>(create);
  static TransferAction _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get asset => $_getSZ(2);
  @$pb.TagNumber(3)
  set asset($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAsset() => $_has(2);
  @$pb.TagNumber(3)
  void clearAsset() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get memo => $_getSZ(3);
  @$pb.TagNumber(4)
  set memo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMemo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemo() => clearField(4);
}

class DelegateAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DelegateAction', package: const $pb.PackageName('JUB.Proto.EOS'), createEmptyInstance: create)
    ..aOS(1, 'from')
    ..aOS(2, 'receiver')
    ..aOS(3, 'netQty')
    ..aOS(4, 'cpuQty')
    ..aOB(5, 'stake')
    ..hasRequiredFields = false
  ;

  DelegateAction._() : super();
  factory DelegateAction() => create();
  factory DelegateAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelegateAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DelegateAction clone() => DelegateAction()..mergeFromMessage(this);
  DelegateAction copyWith(void Function(DelegateAction) updates) => super.copyWith((message) => updates(message as DelegateAction));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DelegateAction create() => DelegateAction._();
  DelegateAction createEmptyInstance() => create();
  static $pb.PbList<DelegateAction> createRepeated() => $pb.PbList<DelegateAction>();
  @$core.pragma('dart2js:noInline')
  static DelegateAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelegateAction>(create);
  static DelegateAction _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get from => $_getSZ(0);
  @$pb.TagNumber(1)
  set from($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get netQty => $_getSZ(2);
  @$pb.TagNumber(3)
  set netQty($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNetQty() => $_has(2);
  @$pb.TagNumber(3)
  void clearNetQty() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cpuQty => $_getSZ(3);
  @$pb.TagNumber(4)
  set cpuQty($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCpuQty() => $_has(3);
  @$pb.TagNumber(4)
  void clearCpuQty() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get stake => $_getBF(4);
  @$pb.TagNumber(5)
  set stake($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStake() => $_has(4);
  @$pb.TagNumber(5)
  void clearStake() => clearField(5);
}

class BuyRamAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BuyRamAction', package: const $pb.PackageName('JUB.Proto.EOS'), createEmptyInstance: create)
    ..aOS(1, 'payer')
    ..aOS(2, 'quant')
    ..aOS(3, 'receiver')
    ..hasRequiredFields = false
  ;

  BuyRamAction._() : super();
  factory BuyRamAction() => create();
  factory BuyRamAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuyRamAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BuyRamAction clone() => BuyRamAction()..mergeFromMessage(this);
  BuyRamAction copyWith(void Function(BuyRamAction) updates) => super.copyWith((message) => updates(message as BuyRamAction));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BuyRamAction create() => BuyRamAction._();
  BuyRamAction createEmptyInstance() => create();
  static $pb.PbList<BuyRamAction> createRepeated() => $pb.PbList<BuyRamAction>();
  @$core.pragma('dart2js:noInline')
  static BuyRamAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuyRamAction>(create);
  static BuyRamAction _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get payer => $_getSZ(0);
  @$pb.TagNumber(1)
  set payer($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayer() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayer() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get quant => $_getSZ(1);
  @$pb.TagNumber(2)
  set quant($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuant() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuant() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get receiver => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiver($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReceiver() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiver() => clearField(3);
}

class SellRamAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SellRamAction', package: const $pb.PackageName('JUB.Proto.EOS'), createEmptyInstance: create)
    ..aOS(1, 'account')
    ..aOS(2, 'byte')
    ..hasRequiredFields = false
  ;

  SellRamAction._() : super();
  factory SellRamAction() => create();
  factory SellRamAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SellRamAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SellRamAction clone() => SellRamAction()..mergeFromMessage(this);
  SellRamAction copyWith(void Function(SellRamAction) updates) => super.copyWith((message) => updates(message as SellRamAction));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SellRamAction create() => SellRamAction._();
  SellRamAction createEmptyInstance() => create();
  static $pb.PbList<SellRamAction> createRepeated() => $pb.PbList<SellRamAction>();
  @$core.pragma('dart2js:noInline')
  static SellRamAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SellRamAction>(create);
  static SellRamAction _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get byte => $_getSZ(1);
  @$pb.TagNumber(2)
  set byte($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasByte() => $_has(1);
  @$pb.TagNumber(2)
  void clearByte() => clearField(2);
}

enum ActionEOS_Action {
  xferAction, 
  deleAction, 
  buyRamAction, 
  sellRamAction, 
  notSet
}

class ActionEOS extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ActionEOS_Action> _ActionEOS_ActionByTag = {
    4 : ActionEOS_Action.xferAction,
    5 : ActionEOS_Action.deleAction,
    6 : ActionEOS_Action.buyRamAction,
    7 : ActionEOS_Action.sellRamAction,
    0 : ActionEOS_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ActionEOS', package: const $pb.PackageName('JUB.Proto.EOS'), createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 7])
    ..e<ENUM_EOS_ACTION_TYPE>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: ENUM_EOS_ACTION_TYPE.XFER, valueOf: ENUM_EOS_ACTION_TYPE.valueOf, enumValues: ENUM_EOS_ACTION_TYPE.values)
    ..aOS(2, 'currency')
    ..aOS(3, 'name')
    ..aOM<TransferAction>(4, 'xferAction', subBuilder: TransferAction.create)
    ..aOM<DelegateAction>(5, 'deleAction', subBuilder: DelegateAction.create)
    ..aOM<BuyRamAction>(6, 'buyRamAction', subBuilder: BuyRamAction.create)
    ..aOM<SellRamAction>(7, 'sellRamAction', subBuilder: SellRamAction.create)
    ..hasRequiredFields = false
  ;

  ActionEOS._() : super();
  factory ActionEOS() => create();
  factory ActionEOS.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActionEOS.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ActionEOS clone() => ActionEOS()..mergeFromMessage(this);
  ActionEOS copyWith(void Function(ActionEOS) updates) => super.copyWith((message) => updates(message as ActionEOS));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActionEOS create() => ActionEOS._();
  ActionEOS createEmptyInstance() => create();
  static $pb.PbList<ActionEOS> createRepeated() => $pb.PbList<ActionEOS>();
  @$core.pragma('dart2js:noInline')
  static ActionEOS getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActionEOS>(create);
  static ActionEOS _defaultInstance;

  ActionEOS_Action whichAction() => _ActionEOS_ActionByTag[$_whichOneof(0)];
  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ENUM_EOS_ACTION_TYPE get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ENUM_EOS_ACTION_TYPE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currency => $_getSZ(1);
  @$pb.TagNumber(2)
  set currency($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrency() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrency() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  TransferAction get xferAction => $_getN(3);
  @$pb.TagNumber(4)
  set xferAction(TransferAction v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasXferAction() => $_has(3);
  @$pb.TagNumber(4)
  void clearXferAction() => clearField(4);
  @$pb.TagNumber(4)
  TransferAction ensureXferAction() => $_ensure(3);

  @$pb.TagNumber(5)
  DelegateAction get deleAction => $_getN(4);
  @$pb.TagNumber(5)
  set deleAction(DelegateAction v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeleAction() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeleAction() => clearField(5);
  @$pb.TagNumber(5)
  DelegateAction ensureDeleAction() => $_ensure(4);

  @$pb.TagNumber(6)
  BuyRamAction get buyRamAction => $_getN(5);
  @$pb.TagNumber(6)
  set buyRamAction(BuyRamAction v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBuyRamAction() => $_has(5);
  @$pb.TagNumber(6)
  void clearBuyRamAction() => clearField(6);
  @$pb.TagNumber(6)
  BuyRamAction ensureBuyRamAction() => $_ensure(5);

  @$pb.TagNumber(7)
  SellRamAction get sellRamAction => $_getN(6);
  @$pb.TagNumber(7)
  set sellRamAction(SellRamAction v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSellRamAction() => $_has(6);
  @$pb.TagNumber(7)
  void clearSellRamAction() => clearField(7);
  @$pb.TagNumber(7)
  SellRamAction ensureSellRamAction() => $_ensure(6);
}

