///
//  Generated code. Do not modify.
//  source: Jub_Hcash.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const InputHC$json = const {
  '1': 'InputHC',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 4, '10': 'amount'},
    const {'1': 'path', '3': 2, '4': 1, '5': 11, '6': '.JUB.Proto.Common.Bip44Path', '10': 'path'},
  ],
};

const OutputHC$json = const {
  '1': 'OutputHC',
  '2': const [
    const {'1': 'change_address', '3': 1, '4': 1, '5': 8, '10': 'changeAddress'},
    const {'1': 'path', '3': 2, '4': 1, '5': 11, '6': '.JUB.Proto.Common.Bip44Path', '10': 'path'},
  ],
};

const TransactionHC$json = const {
  '1': 'TransactionHC',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    const {'1': 'locktime', '3': 2, '4': 1, '5': 13, '10': 'locktime'},
    const {'1': 'inputs', '3': 3, '4': 3, '5': 11, '6': '.JUB.Proto.Hcash.InputHC', '10': 'inputs'},
    const {'1': 'outputs', '3': 4, '4': 3, '5': 11, '6': '.JUB.Proto.Hcash.OutputHC', '10': 'outputs'},
  ],
};

