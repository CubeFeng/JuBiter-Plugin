///
//  Generated code. Do not modify.
//  source: Jub_Common.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ENUM_GRAPHENE_ROLE$json = const {
  '1': 'ENUM_GRAPHENE_ROLE',
  '2': const [
    const {'1': 'OWNER', '2': 0},
    const {'1': 'ACTIVE', '2': 1},
  ],
};

const ENUM_MNEMONIC_STRENGTH$json = const {
  '1': 'ENUM_MNEMONIC_STRENGTH',
  '2': const [
    const {'1': 'STRENGTH128', '2': 0},
    const {'1': 'STRENGTH192', '2': 1},
    const {'1': 'STRENGTH256', '2': 2},
  ],
};

const CURVES$json = const {
  '1': 'CURVES',
  '2': const [
    const {'1': 'SECP256K1', '2': 0},
    const {'1': 'ED25519', '2': 1},
    const {'1': 'NIST256P1', '2': 2},
  ],
};

const ENUM_PUB_FORMAT$json = const {
  '1': 'ENUM_PUB_FORMAT',
  '2': const [
    const {'1': 'HEX', '2': 0},
    const {'1': 'XPUB', '2': 1},
  ],
};

const Bip44Path$json = const {
  '1': 'Bip44Path',
  '2': const [
    const {'1': 'change', '3': 1, '4': 1, '5': 8, '10': 'change'},
    const {'1': 'address_index', '3': 2, '4': 1, '5': 4, '10': 'addressIndex'},
  ],
};

const Slip48Path$json = const {
  '1': 'Slip48Path',
  '2': const [
    const {'1': 'network', '3': 1, '4': 1, '5': 4, '10': 'network'},
    const {'1': 'role', '3': 2, '4': 1, '5': 14, '6': '.JUB.Proto.Common.ENUM_GRAPHENE_ROLE', '10': 'role'},
    const {'1': 'address_index', '3': 3, '4': 1, '5': 4, '10': 'addressIndex'},
    const {'1': 'key_index', '3': 4, '4': 1, '5': 4, '10': 'keyIndex'},
  ],
};

const ContextCfg$json = const {
  '1': 'ContextCfg',
  '2': const [
    const {'1': 'main_path', '3': 1, '4': 1, '5': 9, '10': 'mainPath'},
  ],
};

const DeviceInfo$json = const {
  '1': 'DeviceInfo',
  '2': const [
    const {'1': 'sn', '3': 1, '4': 1, '5': 9, '10': 'sn'},
    const {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'ble_version', '3': 3, '4': 1, '5': 9, '10': 'bleVersion'},
    const {'1': 'firmware_version', '3': 4, '4': 1, '5': 9, '10': 'firmwareVersion'},
    const {'1': 'pin_retry', '3': 5, '4': 1, '5': 13, '10': 'pinRetry'},
    const {'1': 'pin_max_retry', '3': 6, '4': 1, '5': 13, '10': 'pinMaxRetry'},
  ],
};

const ResultInt$json = const {
  '1': 'ResultInt',
  '2': const [
    const {'1': 'state_code', '3': 1, '4': 1, '5': 4, '10': 'stateCode'},
    const {'1': 'value', '3': 2, '4': 1, '5': 13, '10': 'value'},
  ],
};

const ResultString$json = const {
  '1': 'ResultString',
  '2': const [
    const {'1': 'state_code', '3': 1, '4': 1, '5': 4, '10': 'stateCode'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

const ResultAny$json = const {
  '1': 'ResultAny',
  '2': const [
    const {'1': 'state_code', '3': 1, '4': 1, '5': 4, '10': 'stateCode'},
    const {'1': 'value', '3': 2, '4': 3, '5': 11, '6': '.google.protobuf.Any', '10': 'value'},
  ],
};

