///
//  Generated code. Do not modify.
//  source: Jub_Ripple.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'Jub_Ripple.pbenum.dart';

export 'Jub_Ripple.pbenum.dart';

class PymtAmount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PymtAmount', package: const $pb.PackageName('JUB.Proto.Ripple'), createEmptyInstance: create)
    ..aOS(1, 'currency')
    ..aOS(2, 'value')
    ..aOS(3, 'issuer')
    ..hasRequiredFields = false
  ;

  PymtAmount._() : super();
  factory PymtAmount() => create();
  factory PymtAmount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PymtAmount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PymtAmount clone() => PymtAmount()..mergeFromMessage(this);
  PymtAmount copyWith(void Function(PymtAmount) updates) => super.copyWith((message) => updates(message as PymtAmount));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PymtAmount create() => PymtAmount._();
  PymtAmount createEmptyInstance() => create();
  static $pb.PbList<PymtAmount> createRepeated() => $pb.PbList<PymtAmount>();
  @$core.pragma('dart2js:noInline')
  static PymtAmount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PymtAmount>(create);
  static PymtAmount _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currency => $_getSZ(0);
  @$pb.TagNumber(1)
  set currency($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrency() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrency() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get issuer => $_getSZ(2);
  @$pb.TagNumber(3)
  set issuer($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIssuer() => $_has(2);
  @$pb.TagNumber(3)
  void clearIssuer() => clearField(3);
}

class PymtXRP extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PymtXRP', package: const $pb.PackageName('JUB.Proto.Ripple'), createEmptyInstance: create)
    ..e<ENUM_XRP_PYMT_TYPE>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: ENUM_XRP_PYMT_TYPE.DXRP, valueOf: ENUM_XRP_PYMT_TYPE.valueOf, enumValues: ENUM_XRP_PYMT_TYPE.values)
    ..aOM<PymtAmount>(2, 'amount', subBuilder: PymtAmount.create)
    ..aOS(3, 'destination')
    ..aOS(4, 'destinationTag')
    ..aOS(5, 'invoiceId')
    ..aOM<PymtAmount>(6, 'sendMax', subBuilder: PymtAmount.create)
    ..aOM<PymtAmount>(7, 'deliverMin', subBuilder: PymtAmount.create)
    ..hasRequiredFields = false
  ;

  PymtXRP._() : super();
  factory PymtXRP() => create();
  factory PymtXRP.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PymtXRP.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PymtXRP clone() => PymtXRP()..mergeFromMessage(this);
  PymtXRP copyWith(void Function(PymtXRP) updates) => super.copyWith((message) => updates(message as PymtXRP));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PymtXRP create() => PymtXRP._();
  PymtXRP createEmptyInstance() => create();
  static $pb.PbList<PymtXRP> createRepeated() => $pb.PbList<PymtXRP>();
  @$core.pragma('dart2js:noInline')
  static PymtXRP getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PymtXRP>(create);
  static PymtXRP _defaultInstance;

  @$pb.TagNumber(1)
  ENUM_XRP_PYMT_TYPE get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ENUM_XRP_PYMT_TYPE v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  PymtAmount get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount(PymtAmount v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);
  @$pb.TagNumber(2)
  PymtAmount ensureAmount() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get destination => $_getSZ(2);
  @$pb.TagNumber(3)
  set destination($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestination() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestination() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get destinationTag => $_getSZ(3);
  @$pb.TagNumber(4)
  set destinationTag($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDestinationTag() => $_has(3);
  @$pb.TagNumber(4)
  void clearDestinationTag() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get invoiceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set invoiceId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInvoiceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearInvoiceId() => clearField(5);

  @$pb.TagNumber(6)
  PymtAmount get sendMax => $_getN(5);
  @$pb.TagNumber(6)
  set sendMax(PymtAmount v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSendMax() => $_has(5);
  @$pb.TagNumber(6)
  void clearSendMax() => clearField(6);
  @$pb.TagNumber(6)
  PymtAmount ensureSendMax() => $_ensure(5);

  @$pb.TagNumber(7)
  PymtAmount get deliverMin => $_getN(6);
  @$pb.TagNumber(7)
  set deliverMin(PymtAmount v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDeliverMin() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeliverMin() => clearField(7);
  @$pb.TagNumber(7)
  PymtAmount ensureDeliverMin() => $_ensure(6);
}

enum TransactionXRP_Action {
  pymt, 
  notSet
}

class TransactionXRP extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TransactionXRP_Action> _TransactionXRP_ActionByTag = {
    10 : TransactionXRP_Action.pymt,
    0 : TransactionXRP_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionXRP', package: const $pb.PackageName('JUB.Proto.Ripple'), createEmptyInstance: create)
    ..oo(0, [10])
    ..aOS(1, 'account')
    ..e<ENUM_XRP_TX_TYPE>(2, 'type', $pb.PbFieldType.OE, defaultOrMaker: ENUM_XRP_TX_TYPE.PYMT, valueOf: ENUM_XRP_TX_TYPE.valueOf, enumValues: ENUM_XRP_TX_TYPE.values)
    ..aOS(3, 'fee')
    ..aOS(4, 'sequence')
    ..aOS(5, 'accountTxnId')
    ..aOS(6, 'flags')
    ..aOS(7, 'lastLedgerSequence')
    ..aOS(8, 'memos')
    ..aOS(9, 'sourceTag')
    ..aOM<PymtXRP>(10, 'pymt', subBuilder: PymtXRP.create)
    ..hasRequiredFields = false
  ;

  TransactionXRP._() : super();
  factory TransactionXRP() => create();
  factory TransactionXRP.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionXRP.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionXRP clone() => TransactionXRP()..mergeFromMessage(this);
  TransactionXRP copyWith(void Function(TransactionXRP) updates) => super.copyWith((message) => updates(message as TransactionXRP));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionXRP create() => TransactionXRP._();
  TransactionXRP createEmptyInstance() => create();
  static $pb.PbList<TransactionXRP> createRepeated() => $pb.PbList<TransactionXRP>();
  @$core.pragma('dart2js:noInline')
  static TransactionXRP getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionXRP>(create);
  static TransactionXRP _defaultInstance;

  TransactionXRP_Action whichAction() => _TransactionXRP_ActionByTag[$_whichOneof(0)];
  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  ENUM_XRP_TX_TYPE get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(ENUM_XRP_TX_TYPE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fee => $_getSZ(2);
  @$pb.TagNumber(3)
  set fee($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sequence => $_getSZ(3);
  @$pb.TagNumber(4)
  set sequence($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSequence() => $_has(3);
  @$pb.TagNumber(4)
  void clearSequence() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get accountTxnId => $_getSZ(4);
  @$pb.TagNumber(5)
  set accountTxnId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAccountTxnId() => $_has(4);
  @$pb.TagNumber(5)
  void clearAccountTxnId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get flags => $_getSZ(5);
  @$pb.TagNumber(6)
  set flags($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFlags() => $_has(5);
  @$pb.TagNumber(6)
  void clearFlags() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get lastLedgerSequence => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastLedgerSequence($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastLedgerSequence() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastLedgerSequence() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get memos => $_getSZ(7);
  @$pb.TagNumber(8)
  set memos($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMemos() => $_has(7);
  @$pb.TagNumber(8)
  void clearMemos() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get sourceTag => $_getSZ(8);
  @$pb.TagNumber(9)
  set sourceTag($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSourceTag() => $_has(8);
  @$pb.TagNumber(9)
  void clearSourceTag() => clearField(9);

  @$pb.TagNumber(10)
  PymtXRP get pymt => $_getN(9);
  @$pb.TagNumber(10)
  set pymt(PymtXRP v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasPymt() => $_has(9);
  @$pb.TagNumber(10)
  void clearPymt() => clearField(10);
  @$pb.TagNumber(10)
  PymtXRP ensurePymt() => $_ensure(9);
}

