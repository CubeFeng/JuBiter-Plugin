///
//  Generated code. Do not modify.
//  source: jubiterblue.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Int32Value$json = const {
  '1': 'Int32Value',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
  ],
};

const BluetoothState$json = const {
  '1': 'BluetoothState',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.BluetoothState.State', '10': 'state'},
  ],
  '4': const [BluetoothState_State$json],
};

const BluetoothState_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'UNAVAILABLE', '2': 1},
    const {'1': 'UNAUTHORIZED', '2': 2},
    const {'1': 'TURNING_ON', '2': 3},
    const {'1': 'ON', '2': 4},
    const {'1': 'TURNING_OFF', '2': 5},
    const {'1': 'OFF', '2': 6},
  ],
};

const AdvertisementData$json = const {
  '1': 'AdvertisementData',
  '2': const [
    const {'1': 'local_name', '3': 1, '4': 1, '5': 9, '10': 'localName'},
    const {'1': 'tx_power_level', '3': 2, '4': 1, '5': 11, '6': '.Int32Value', '10': 'txPowerLevel'},
    const {'1': 'connectable', '3': 3, '4': 1, '5': 8, '10': 'connectable'},
    const {'1': 'manufacturer_data', '3': 4, '4': 3, '5': 11, '6': '.AdvertisementData.ManufacturerDataEntry', '10': 'manufacturerData'},
    const {'1': 'service_data', '3': 5, '4': 3, '5': 11, '6': '.AdvertisementData.ServiceDataEntry', '10': 'serviceData'},
    const {'1': 'service_uuids', '3': 6, '4': 3, '5': 9, '10': 'serviceUuids'},
  ],
  '3': const [AdvertisementData_ManufacturerDataEntry$json, AdvertisementData_ServiceDataEntry$json],
};

const AdvertisementData_ManufacturerDataEntry$json = const {
  '1': 'ManufacturerDataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': const {'7': true},
};

const AdvertisementData_ServiceDataEntry$json = const {
  '1': 'ServiceDataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': const {'7': true},
};

const ScanSettings$json = const {
  '1': 'ScanSettings',
  '2': const [
    const {'1': 'android_scan_mode', '3': 1, '4': 1, '5': 5, '10': 'androidScanMode'},
    const {'1': 'service_uuids', '3': 2, '4': 3, '5': 9, '10': 'serviceUuids'},
  ],
};

const ScanResult$json = const {
  '1': 'ScanResult',
  '2': const [
    const {'1': 'device', '3': 1, '4': 1, '5': 11, '6': '.BluetoothDevice', '10': 'device'},
    const {'1': 'advertisement_data', '3': 2, '4': 1, '5': 11, '6': '.AdvertisementData', '10': 'advertisementData'},
    const {'1': 'rssi', '3': 3, '4': 1, '5': 5, '10': 'rssi'},
  ],
};

const ConnectRequest$json = const {
  '1': 'ConnectRequest',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'timeout', '3': 2, '4': 1, '5': 5, '10': 'timeout'},
    const {'1': 'android_auto_connect', '3': 3, '4': 1, '5': 8, '10': 'androidAutoConnect'},
  ],
};

const BluetoothDevice$json = const {
  '1': 'BluetoothDevice',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.BluetoothDevice.Type', '10': 'type'},
  ],
  '4': const [BluetoothDevice_Type$json],
};

const BluetoothDevice_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CLASSIC', '2': 1},
    const {'1': 'LE', '2': 2},
    const {'1': 'DUAL', '2': 3},
  ],
};

const DeviceStateResponse$json = const {
  '1': 'DeviceStateResponse',
  '2': const [
    const {'1': 'remote_id', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.DeviceStateResponse.BluetoothDeviceState', '10': 'state'},
    const {'1': 'deviceID', '3': 3, '4': 1, '5': 5, '10': 'deviceID'},
  ],
  '4': const [DeviceStateResponse_BluetoothDeviceState$json],
};

const DeviceStateResponse_BluetoothDeviceState$json = const {
  '1': 'BluetoothDeviceState',
  '2': const [
    const {'1': 'DISCONNECTED', '2': 0},
    const {'1': 'CONNECTING', '2': 1},
    const {'1': 'CONNECTED', '2': 2},
    const {'1': 'DISCONNECTING', '2': 3},
  ],
};

const ConnectedDevicesResponse$json = const {
  '1': 'ConnectedDevicesResponse',
  '2': const [
    const {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.BluetoothDevice', '10': 'devices'},
  ],
};

