///
//  Generated code. Do not modify.
//  source: Jub_Bitcoin.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ENUM_COIN_TYPE_BTC$json = const {
  '1': 'ENUM_COIN_TYPE_BTC',
  '2': const [
    const {'1': 'COINBTC', '2': 0},
    const {'1': 'COINBCH', '2': 1},
    const {'1': 'COINLTC', '2': 2},
    const {'1': 'COINUSDT', '2': 3},
    const {'1': 'COINDASH', '2': 4},
    const {'1': 'COINQTUM', '2': 5},
  ],
};

const ENUM_TRAN_STYPE_BTC$json = const {
  '1': 'ENUM_TRAN_STYPE_BTC',
  '2': const [
    const {'1': 'P2PKH', '2': 0},
    const {'1': 'P2SH_P2WPKH', '2': 1},
    const {'1': 'P2SH_MULTISIG', '2': 2},
    const {'1': 'P2PK', '2': 3},
  ],
};

const BTC_UNIT_TYPE$json = const {
  '1': 'BTC_UNIT_TYPE',
  '2': const [
    const {'1': 'BTC', '2': 0},
    const {'1': 'cBTC', '2': 1},
    const {'1': 'mBTC', '2': 2},
    const {'1': 'uBTC', '2': 3},
    const {'1': 'Satoshi', '2': 4},
  ],
};

const ENUM_SCRIPT_TYPE_BTC$json = const {
  '1': 'ENUM_SCRIPT_TYPE_BTC',
  '2': const [
    const {'1': 'SC_P2PKH', '2': 0},
    const {'1': 'SC_RETURN0', '2': 1},
    const {'1': 'SC_QRC20', '2': 3},
  ],
};

const ContextCfgBTC$json = const {
  '1': 'ContextCfgBTC',
  '2': const [
    const {'1': 'main_path', '3': 1, '4': 1, '5': 9, '10': 'mainPath'},
    const {'1': 'coin_type', '3': 2, '4': 1, '5': 14, '6': '.JUB.Proto.Bitcoin.ENUM_COIN_TYPE_BTC', '10': 'coinType'},
    const {'1': 'trans_type', '3': 3, '4': 1, '5': 14, '6': '.JUB.Proto.Bitcoin.ENUM_TRAN_STYPE_BTC', '10': 'transType'},
  ],
};

const InputBTC$json = const {
  '1': 'InputBTC',
  '2': const [
    const {'1': 'pre_hash', '3': 1, '4': 1, '5': 9, '10': 'preHash'},
    const {'1': 'pre_index', '3': 2, '4': 1, '5': 13, '10': 'preIndex'},
    const {'1': 'amount', '3': 3, '4': 1, '5': 4, '10': 'amount'},
    const {'1': 'path', '3': 4, '4': 1, '5': 11, '6': '.JUB.Proto.Common.Bip44Path', '10': 'path'},
  ],
};

const StandardOutput$json = const {
  '1': 'StandardOutput',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 4, '10': 'amount'},
    const {'1': 'change_address', '3': 3, '4': 1, '5': 8, '10': 'changeAddress'},
    const {'1': 'path', '3': 4, '4': 1, '5': 11, '6': '.JUB.Proto.Common.Bip44Path', '10': 'path'},
  ],
};

const Return0Output$json = const {
  '1': 'Return0Output',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 4, '10': 'amount'},
    const {'1': 'data', '3': 2, '4': 1, '5': 9, '10': 'data'},
  ],
};

const QRC20Output$json = const {
  '1': 'QRC20Output',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 9, '10': 'data'},
  ],
};

const OutputBTC$json = const {
  '1': 'OutputBTC',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.JUB.Proto.Bitcoin.ENUM_SCRIPT_TYPE_BTC', '10': 'type'},
    const {'1': 'std_output', '3': 2, '4': 1, '5': 11, '6': '.JUB.Proto.Bitcoin.StandardOutput', '9': 0, '10': 'stdOutput'},
    const {'1': 'return0_output', '3': 3, '4': 1, '5': 11, '6': '.JUB.Proto.Bitcoin.Return0Output', '9': 0, '10': 'return0Output'},
    const {'1': 'qrc20_output', '3': 4, '4': 1, '5': 11, '6': '.JUB.Proto.Bitcoin.QRC20Output', '9': 0, '10': 'qrc20Output'},
  ],
  '8': const [
    const {'1': 'output'},
  ],
};

const TransactionBTC$json = const {
  '1': 'TransactionBTC',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    const {'1': 'locktime', '3': 2, '4': 1, '5': 13, '10': 'locktime'},
    const {'1': 'inputs', '3': 3, '4': 3, '5': 11, '6': '.JUB.Proto.Bitcoin.InputBTC', '10': 'inputs'},
    const {'1': 'outputs', '3': 4, '4': 3, '5': 11, '6': '.JUB.Proto.Bitcoin.OutputBTC', '10': 'outputs'},
  ],
};

