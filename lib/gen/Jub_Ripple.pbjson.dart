///
//  Generated code. Do not modify.
//  source: Jub_Ripple.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ENUM_XRP_TX_TYPE$json = const {
  '1': 'ENUM_XRP_TX_TYPE',
  '2': const [
    const {'1': 'PYMT', '2': 0},
  ],
};

const ENUM_XRP_PYMT_TYPE$json = const {
  '1': 'ENUM_XRP_PYMT_TYPE',
  '2': const [
    const {'1': 'DXRP', '2': 0},
    const {'1': 'FX', '2': 1},
    const {'1': 'CHECKS', '2': 2},
    const {'1': 'ESCROW', '2': 3},
    const {'1': 'PRTL', '2': 4},
    const {'1': 'CHAN', '2': 5},
  ],
};

const PymtAmount$json = const {
  '1': 'PymtAmount',
  '2': const [
    const {'1': 'currency', '3': 1, '4': 1, '5': 9, '10': 'currency'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'issuer', '3': 3, '4': 1, '5': 9, '10': 'issuer'},
  ],
};

const PymtXRP$json = const {
  '1': 'PymtXRP',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.JUB.Proto.Ripple.ENUM_XRP_PYMT_TYPE', '10': 'type'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 11, '6': '.JUB.Proto.Ripple.PymtAmount', '10': 'amount'},
    const {'1': 'destination', '3': 3, '4': 1, '5': 9, '10': 'destination'},
    const {'1': 'destination_tag', '3': 4, '4': 1, '5': 9, '10': 'destinationTag'},
    const {'1': 'invoice_id', '3': 5, '4': 1, '5': 9, '10': 'invoiceId'},
    const {'1': 'send_max', '3': 6, '4': 1, '5': 11, '6': '.JUB.Proto.Ripple.PymtAmount', '10': 'sendMax'},
    const {'1': 'deliver_min', '3': 7, '4': 1, '5': 11, '6': '.JUB.Proto.Ripple.PymtAmount', '10': 'deliverMin'},
  ],
};

const TransactionXRP$json = const {
  '1': 'TransactionXRP',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 9, '10': 'account'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.JUB.Proto.Ripple.ENUM_XRP_TX_TYPE', '10': 'type'},
    const {'1': 'fee', '3': 3, '4': 1, '5': 9, '10': 'fee'},
    const {'1': 'sequence', '3': 4, '4': 1, '5': 9, '10': 'sequence'},
    const {'1': 'account_txn_id', '3': 5, '4': 1, '5': 9, '10': 'accountTxnId'},
    const {'1': 'flags', '3': 6, '4': 1, '5': 9, '10': 'flags'},
    const {'1': 'last_ledger_sequence', '3': 7, '4': 1, '5': 9, '10': 'lastLedgerSequence'},
    const {'1': 'memos', '3': 8, '4': 1, '5': 9, '10': 'memos'},
    const {'1': 'source_tag', '3': 9, '4': 1, '5': 9, '10': 'sourceTag'},
    const {'1': 'pymt', '3': 10, '4': 1, '5': 11, '6': '.JUB.Proto.Ripple.PymtXRP', '9': 0, '10': 'pymt'},
  ],
  '8': const [
    const {'1': 'action'},
  ],
};

