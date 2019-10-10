///
//  Generated code. Do not modify.
//  source: Jub_Common.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

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
    const {'1': 'secp256k1', '2': 0},
    const {'1': 'ed25519', '2': 1},
    const {'1': 'nist256p1', '2': 2},
  ],
};

const Bip32Path$json = const {
  '1': 'Bip32Path',
  '2': const [
    const {'1': 'change', '3': 1, '4': 1, '5': 8, '10': 'change'},
    const {'1': 'addressIndex', '3': 2, '4': 1, '5': 4, '10': 'addressIndex'},
  ],
};

const DeviceInfo$json = const {
  '1': 'DeviceInfo',
  '2': const [
    const {'1': 'sn', '3': 1, '4': 1, '5': 9, '10': 'sn'},
    const {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'bleVersion', '3': 3, '4': 1, '5': 9, '10': 'bleVersion'},
    const {'1': 'firmwareVersion', '3': 4, '4': 1, '5': 9, '10': 'firmwareVersion'},
    const {'1': 'pinRetry', '3': 5, '4': 1, '5': 13, '10': 'pinRetry'},
    const {'1': 'pinMaxRetry', '3': 6, '4': 1, '5': 13, '10': 'pinMaxRetry'},
  ],
};

const ResultInt$json = const {
  '1': 'ResultInt',
  '2': const [
    const {'1': 'stateCode', '3': 1, '4': 1, '5': 4, '10': 'stateCode'},
    const {'1': 'value', '3': 2, '4': 1, '5': 13, '10': 'value'},
  ],
};

const ResultString$json = const {
  '1': 'ResultString',
  '2': const [
    const {'1': 'stateCode', '3': 1, '4': 1, '5': 4, '10': 'stateCode'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

const ResultAny$json = const {
  '1': 'ResultAny',
  '2': const [
    const {'1': 'stateCode', '3': 1, '4': 1, '5': 4, '10': 'stateCode'},
    const {'1': 'value', '3': 2, '4': 3, '5': 11, '6': '.google.protobuf.Any', '10': 'value'},
  ],
};

