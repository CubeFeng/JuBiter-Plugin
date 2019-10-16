///
//  Generated code. Do not modify.
//  source: jubiterblue.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'jubiterblue.pbenum.dart';

export 'jubiterblue.pbenum.dart';

class Int32Value extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Int32Value', createEmptyInstance: create)
    ..a<$core.int>(1, 'value', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Int32Value._() : super();
  factory Int32Value() => create();
  factory Int32Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Int32Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Int32Value clone() => Int32Value()..mergeFromMessage(this);
  Int32Value copyWith(void Function(Int32Value) updates) => super.copyWith((message) => updates(message as Int32Value));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Int32Value create() => Int32Value._();
  Int32Value createEmptyInstance() => create();
  static $pb.PbList<Int32Value> createRepeated() => $pb.PbList<Int32Value>();
  @$core.pragma('dart2js:noInline')
  static Int32Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Int32Value>(create);
  static Int32Value _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class BluetoothState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BluetoothState', createEmptyInstance: create)
    ..e<BluetoothState_State>(1, 'state', $pb.PbFieldType.OE, defaultOrMaker: BluetoothState_State.UNKNOWN, valueOf: BluetoothState_State.valueOf, enumValues: BluetoothState_State.values)
    ..hasRequiredFields = false
  ;

  BluetoothState._() : super();
  factory BluetoothState() => create();
  factory BluetoothState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BluetoothState clone() => BluetoothState()..mergeFromMessage(this);
  BluetoothState copyWith(void Function(BluetoothState) updates) => super.copyWith((message) => updates(message as BluetoothState));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothState create() => BluetoothState._();
  BluetoothState createEmptyInstance() => create();
  static $pb.PbList<BluetoothState> createRepeated() => $pb.PbList<BluetoothState>();
  @$core.pragma('dart2js:noInline')
  static BluetoothState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothState>(create);
  static BluetoothState _defaultInstance;

  @$pb.TagNumber(1)
  BluetoothState_State get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(BluetoothState_State v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
}

class AdvertisementData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AdvertisementData', createEmptyInstance: create)
    ..aOS(1, 'localName')
    ..aOM<Int32Value>(2, 'txPowerLevel', subBuilder: Int32Value.create)
    ..aOB(3, 'connectable')
    ..m<$core.int, $core.List<$core.int>>(4, 'manufacturerData', entryClassName: 'AdvertisementData.ManufacturerDataEntry', keyFieldType: $pb.PbFieldType.O3, valueFieldType: $pb.PbFieldType.OY)
    ..m<$core.String, $core.List<$core.int>>(5, 'serviceData', entryClassName: 'AdvertisementData.ServiceDataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OY)
    ..pPS(6, 'serviceUuids')
    ..hasRequiredFields = false
  ;

  AdvertisementData._() : super();
  factory AdvertisementData() => create();
  factory AdvertisementData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdvertisementData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AdvertisementData clone() => AdvertisementData()..mergeFromMessage(this);
  AdvertisementData copyWith(void Function(AdvertisementData) updates) => super.copyWith((message) => updates(message as AdvertisementData));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AdvertisementData create() => AdvertisementData._();
  AdvertisementData createEmptyInstance() => create();
  static $pb.PbList<AdvertisementData> createRepeated() => $pb.PbList<AdvertisementData>();
  @$core.pragma('dart2js:noInline')
  static AdvertisementData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdvertisementData>(create);
  static AdvertisementData _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localName => $_getSZ(0);
  @$pb.TagNumber(1)
  set localName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalName() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalName() => clearField(1);

  @$pb.TagNumber(2)
  Int32Value get txPowerLevel => $_getN(1);
  @$pb.TagNumber(2)
  set txPowerLevel(Int32Value v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxPowerLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxPowerLevel() => clearField(2);
  @$pb.TagNumber(2)
  Int32Value ensureTxPowerLevel() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get connectable => $_getBF(2);
  @$pb.TagNumber(3)
  set connectable($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConnectable() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectable() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.int, $core.List<$core.int>> get manufacturerData => $_getMap(3);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.List<$core.int>> get serviceData => $_getMap(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get serviceUuids => $_getList(5);
}

class ScanSettings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ScanSettings', createEmptyInstance: create)
    ..a<$core.int>(1, 'androidScanMode', $pb.PbFieldType.O3)
    ..pPS(2, 'serviceUuids')
    ..hasRequiredFields = false
  ;

  ScanSettings._() : super();
  factory ScanSettings() => create();
  factory ScanSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ScanSettings clone() => ScanSettings()..mergeFromMessage(this);
  ScanSettings copyWith(void Function(ScanSettings) updates) => super.copyWith((message) => updates(message as ScanSettings));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScanSettings create() => ScanSettings._();
  ScanSettings createEmptyInstance() => create();
  static $pb.PbList<ScanSettings> createRepeated() => $pb.PbList<ScanSettings>();
  @$core.pragma('dart2js:noInline')
  static ScanSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScanSettings>(create);
  static ScanSettings _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get androidScanMode => $_getIZ(0);
  @$pb.TagNumber(1)
  set androidScanMode($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAndroidScanMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAndroidScanMode() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get serviceUuids => $_getList(1);
}

class ScanResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ScanResult', createEmptyInstance: create)
    ..aOM<BluetoothDevice>(1, 'device', subBuilder: BluetoothDevice.create)
    ..aOM<AdvertisementData>(2, 'advertisementData', subBuilder: AdvertisementData.create)
    ..a<$core.int>(3, 'rssi', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ScanResult._() : super();
  factory ScanResult() => create();
  factory ScanResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScanResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ScanResult clone() => ScanResult()..mergeFromMessage(this);
  ScanResult copyWith(void Function(ScanResult) updates) => super.copyWith((message) => updates(message as ScanResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScanResult create() => ScanResult._();
  ScanResult createEmptyInstance() => create();
  static $pb.PbList<ScanResult> createRepeated() => $pb.PbList<ScanResult>();
  @$core.pragma('dart2js:noInline')
  static ScanResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScanResult>(create);
  static ScanResult _defaultInstance;

  @$pb.TagNumber(1)
  BluetoothDevice get device => $_getN(0);
  @$pb.TagNumber(1)
  set device(BluetoothDevice v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => clearField(1);
  @$pb.TagNumber(1)
  BluetoothDevice ensureDevice() => $_ensure(0);

  @$pb.TagNumber(2)
  AdvertisementData get advertisementData => $_getN(1);
  @$pb.TagNumber(2)
  set advertisementData(AdvertisementData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAdvertisementData() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdvertisementData() => clearField(2);
  @$pb.TagNumber(2)
  AdvertisementData ensureAdvertisementData() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get rssi => $_getIZ(2);
  @$pb.TagNumber(3)
  set rssi($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRssi() => $_has(2);
  @$pb.TagNumber(3)
  void clearRssi() => clearField(3);
}

class ConnectRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ConnectRequest', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..a<$core.int>(2, 'timeout', $pb.PbFieldType.O3)
    ..aOB(3, 'androidAutoConnect')
    ..hasRequiredFields = false
  ;

  ConnectRequest._() : super();
  factory ConnectRequest() => create();
  factory ConnectRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ConnectRequest clone() => ConnectRequest()..mergeFromMessage(this);
  ConnectRequest copyWith(void Function(ConnectRequest) updates) => super.copyWith((message) => updates(message as ConnectRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectRequest create() => ConnectRequest._();
  ConnectRequest createEmptyInstance() => create();
  static $pb.PbList<ConnectRequest> createRepeated() => $pb.PbList<ConnectRequest>();
  @$core.pragma('dart2js:noInline')
  static ConnectRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectRequest>(create);
  static ConnectRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get timeout => $_getIZ(1);
  @$pb.TagNumber(2)
  set timeout($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimeout() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeout() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get androidAutoConnect => $_getBF(2);
  @$pb.TagNumber(3)
  set androidAutoConnect($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAndroidAutoConnect() => $_has(2);
  @$pb.TagNumber(3)
  void clearAndroidAutoConnect() => clearField(3);
}

class BluetoothDevice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BluetoothDevice', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..aOS(2, 'name')
    ..e<BluetoothDevice_Type>(3, 'type', $pb.PbFieldType.OE, defaultOrMaker: BluetoothDevice_Type.UNKNOWN, valueOf: BluetoothDevice_Type.valueOf, enumValues: BluetoothDevice_Type.values)
    ..hasRequiredFields = false
  ;

  BluetoothDevice._() : super();
  factory BluetoothDevice() => create();
  factory BluetoothDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BluetoothDevice clone() => BluetoothDevice()..mergeFromMessage(this);
  BluetoothDevice copyWith(void Function(BluetoothDevice) updates) => super.copyWith((message) => updates(message as BluetoothDevice));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothDevice create() => BluetoothDevice._();
  BluetoothDevice createEmptyInstance() => create();
  static $pb.PbList<BluetoothDevice> createRepeated() => $pb.PbList<BluetoothDevice>();
  @$core.pragma('dart2js:noInline')
  static BluetoothDevice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothDevice>(create);
  static BluetoothDevice _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  BluetoothDevice_Type get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(BluetoothDevice_Type v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class DeviceStateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeviceStateResponse', createEmptyInstance: create)
    ..aOS(1, 'remoteId')
    ..e<DeviceStateResponse_BluetoothDeviceState>(2, 'state', $pb.PbFieldType.OE, defaultOrMaker: DeviceStateResponse_BluetoothDeviceState.DISCONNECTED, valueOf: DeviceStateResponse_BluetoothDeviceState.valueOf, enumValues: DeviceStateResponse_BluetoothDeviceState.values)
    ..hasRequiredFields = false
  ;

  DeviceStateResponse._() : super();
  factory DeviceStateResponse() => create();
  factory DeviceStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeviceStateResponse clone() => DeviceStateResponse()..mergeFromMessage(this);
  DeviceStateResponse copyWith(void Function(DeviceStateResponse) updates) => super.copyWith((message) => updates(message as DeviceStateResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceStateResponse create() => DeviceStateResponse._();
  DeviceStateResponse createEmptyInstance() => create();
  static $pb.PbList<DeviceStateResponse> createRepeated() => $pb.PbList<DeviceStateResponse>();
  @$core.pragma('dart2js:noInline')
  static DeviceStateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceStateResponse>(create);
  static DeviceStateResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  DeviceStateResponse_BluetoothDeviceState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(DeviceStateResponse_BluetoothDeviceState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

class ConnectedDevicesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ConnectedDevicesResponse', createEmptyInstance: create)
    ..pc<BluetoothDevice>(1, 'devices', $pb.PbFieldType.PM, subBuilder: BluetoothDevice.create)
    ..hasRequiredFields = false
  ;

  ConnectedDevicesResponse._() : super();
  factory ConnectedDevicesResponse() => create();
  factory ConnectedDevicesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectedDevicesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ConnectedDevicesResponse clone() => ConnectedDevicesResponse()..mergeFromMessage(this);
  ConnectedDevicesResponse copyWith(void Function(ConnectedDevicesResponse) updates) => super.copyWith((message) => updates(message as ConnectedDevicesResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectedDevicesResponse create() => ConnectedDevicesResponse._();
  ConnectedDevicesResponse createEmptyInstance() => create();
  static $pb.PbList<ConnectedDevicesResponse> createRepeated() => $pb.PbList<ConnectedDevicesResponse>();
  @$core.pragma('dart2js:noInline')
  static ConnectedDevicesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectedDevicesResponse>(create);
  static ConnectedDevicesResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BluetoothDevice> get devices => $_getList(0);
}

