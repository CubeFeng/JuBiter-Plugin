///
//  Generated code. Do not modify.
//  source: Jub_EOS.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ENUM_EOS_ACTION_TYPE$json = const {
  '1': 'ENUM_EOS_ACTION_TYPE',
  '2': const [
    const {'1': 'XFER', '2': 0},
    const {'1': 'DELE', '2': 1},
    const {'1': 'UNDELE', '2': 2},
    const {'1': 'BUYRAM', '2': 3},
    const {'1': 'SELLRAM', '2': 4},
  ],
};

const TransferAction$json = const {
  '1': 'TransferAction',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 2, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'asset', '3': 3, '4': 1, '5': 9, '10': 'asset'},
    const {'1': 'memo', '3': 4, '4': 1, '5': 9, '10': 'memo'},
  ],
};

const DelegateAction$json = const {
  '1': 'DelegateAction',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'net_qty', '3': 3, '4': 1, '5': 9, '10': 'netQty'},
    const {'1': 'cpu_qty', '3': 4, '4': 1, '5': 9, '10': 'cpuQty'},
    const {'1': 'stake', '3': 5, '4': 1, '5': 8, '10': 'stake'},
  ],
};

const BuyRamAction$json = const {
  '1': 'BuyRamAction',
  '2': const [
    const {'1': 'payer', '3': 1, '4': 1, '5': 9, '10': 'payer'},
    const {'1': 'quant', '3': 2, '4': 1, '5': 9, '10': 'quant'},
    const {'1': 'receiver', '3': 3, '4': 1, '5': 9, '10': 'receiver'},
  ],
};

const SellRamAction$json = const {
  '1': 'SellRamAction',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    const {'1': 'byte', '3': 2, '4': 1, '5': 9, '10': 'byte'},
  ],
};

const ActionEOS$json = const {
  '1': 'ActionEOS',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.JUB.Proto.EOS.ENUM_EOS_ACTION_TYPE', '10': 'type'},
    const {'1': 'currency', '3': 2, '4': 1, '5': 9, '10': 'currency'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'xfer_action', '3': 4, '4': 1, '5': 11, '6': '.JUB.Proto.EOS.TransferAction', '9': 0, '10': 'xferAction'},
    const {'1': 'dele_action', '3': 5, '4': 1, '5': 11, '6': '.JUB.Proto.EOS.DelegateAction', '9': 0, '10': 'deleAction'},
    const {'1': 'buy_ram_action', '3': 6, '4': 1, '5': 11, '6': '.JUB.Proto.EOS.BuyRamAction', '9': 0, '10': 'buyRamAction'},
    const {'1': 'sell_ram_action', '3': 7, '4': 1, '5': 11, '6': '.JUB.Proto.EOS.SellRamAction', '9': 0, '10': 'sellRamAction'},
  ],
  '8': const [
    const {'1': 'action'},
  ],
};

