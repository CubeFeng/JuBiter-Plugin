////
////  JubSDKBTC.swift
////  JubSDKProtobuf
////
////  Created by Pan Min on 2019/12/13.
////  Copyright © 2019 JuBiter. All rights reserved.
////
//
//import Foundation
//import SwiftProtobuf
//import JubSDKCore
//
//internal func inlinePb2EnumCoinTypeBTC(pb: JUB_Proto_Bitcoin_ENUM_COIN_TYPE_BTC) -> JUB_ENUM_COINTYPE_BTC {
//    var coinType:JUB_ENUM_COINTYPE_BTC
//    
//    switch pb {
//    case .coinbtc:
//        coinType = COINBTC
//    case .coinbch:
//        coinType = COINBCH
//    case .coinltc:
//        coinType = COINLTC
//    case .coinusdt:
//        coinType = COINUSDT
//    case .coindash:
//        coinType = COINDASH
//    case .coinqtum:
//        coinType = COINQTUM
//    default:
//        coinType = COINBTC
//    }
//    
//    return coinType
//}
//
//internal func inlinePb2EnumTransTypeBTC(pb: JUB_Proto_Bitcoin_ENUM_TRAN_STYPE_BTC) -> JUB_ENUM_BTC_TRANS_TYPE {
//    var transType:JUB_ENUM_BTC_TRANS_TYPE
//    
//    switch pb {
//    case .p2Pk:
//        transType = p2pkh
//    case .p2Pkh:
//        transType = p2pkh
//    case .p2ShP2Wpkh:
//        transType = p2sh_p2wpkh
//    case .p2ShMultisig:
//        transType = trans_type_ns_item
//    default:
//        transType = trans_type_ns_item
//    }
//    
//    return transType
//}
//
//internal func inlinePb2EnumBTCUnitType(pb: JUB_Proto_Bitcoin_BTC_UNIT_TYPE) -> JUB_ENUM_BTC_UNIT_TYPE {
//    var unitType: JUB_ENUM_BTC_UNIT_TYPE
//    
//    switch pb {
//    case .btc:
//        unitType = BTC
//    case .cBtc:
//        unitType = cBTC
//    case .mBtc:
//        unitType = mBTC
//    case .uBtc:
//        unitType = uBTC
//    case .satoshi:
//        unitType = Satoshi
//    default:
//        unitType = ns
//    }
//    
//    return unitType
//}
//
//internal func inlinePb2ContextCfgBTC(pb: JUB_Proto_Bitcoin_ContextCfgBTC) -> CONTEXT_CONFIG_BTC {
////    var cfg: CONTEXT_CONFIG_BTC = CONTEXT_CONFIG_BTC.init()
////
////    cfg.mainPath = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.mainPath)
////    cfg.coinType = inlinePb2EnumCoinTypeBTC(pb: pb.coinType)
////    cfg.transType = inlinePb2EnumTransTypeBTC(pb: pb.transType)
////
////    return cfg
//    return CONTEXT_CONFIG_BTC(mainPath: UnsafeMutablePointer<JUB_CHAR>(mutating: pb.mainPath),
//                              coinType: inlinePb2EnumCoinTypeBTC(pb: pb.coinType),
//                              transType: inlinePb2EnumTransTypeBTC(pb: pb.transType))
//}
//
//internal func inlinePb2Output(pb: JUB_Proto_Bitcoin_StandardOutput) -> OUTPUT {
//    var output: OUTPUT = OUTPUT.init()
//    
//    output.address = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.address)
//    output.amount = pb.amount
//    if (pb.changeAddress) {
//        output.changeAddress = BOOL_TRUE
//    }
//    else {
//        output.changeAddress = BOOL_FALSE
//    }
//    output.path = inlinePb2Bip44Path(pb: pb.path)
//    
//    return output
//}
//
////internal func inlinePb2OutputReturn0(pb: JUB_Proto_Bitcoin_Return0Output) -> OUTPUT_RETURN0 {
////    var output: OUTPUT_RETURN0 = OUTPUT_RETURN0.init()
////
////    output.amount = pb.amount
////
//////    output.data = "pb.data"//cString(using: String.Encoding.utf8)
////    output.dataLen = JUB_UINT16(pb.data.count)
////    let data = pb.data.data(using: .utf8)!
//////    let buff = [UInt8](data)
////    let buff = [UInt8](data)
////    //output.data = buff
////    let array = data.withUnsafeBytes {
////       [UInt8](UnsafeMutablePointer)(start: $0, cout: data.count)
////    }
//////    memcpy(output.data, [UInt8](data), output.dataLen)
//////    NSMutableArray.self; *characters = [[NSMutableArray, alloc] initWithCapacity:[pb.data length]]
//////    let charArray: [CChar] = pb.data.cString(using: String.Encoding.utf8)!
//////    memcpy(UnsafeMutableRawPointer(&output.data[0]).assumingMemoryBound(to: Int8.self), charArray, pb.data.count)
////    
//////    let output = OUTPUT_RETURN0(amount: pb.amount,
//////                                dataLen: JUB_UINT16(pb.data.count),
//////                                data: pb.data)
////    
////    return output
////}
//
//internal func inlinePb2OutputQrc20(pb: JUB_Proto_Bitcoin_QRC20Output) -> OUTPUT_QRC20 {
//    var output: OUTPUT_QRC20 = OUTPUT_QRC20.init()
//    
////    output.data = pb.data
//    output.dataLen = JUB_UINT16(pb.data.count)
//    
//    return output
//}
//
//internal func inlinePb2OutputBTC(pb: JUB_Proto_Bitcoin_OutputBTC) -> OUTPUT_BTC {
//    var output: OUTPUT_BTC = OUTPUT_BTC.init()
//    
//    switch pb.type {
//    case .standard:
//        output.type = P2PKH
//        output.stdOutput = inlinePb2Output(pb: pb.standardOputput)
////    case .return0:
////        output.type = RETURN0
////        output.return0 = inlinePb2OutputReturn0(pb: pb.return0Output)
//    case .qrc20:
//        output.type = QRC20
//        output.qrc20 = inlinePb2OutputQrc20(pb: pb.qrc20Output)
//    default:
//        output.stdOutput = inlinePb2Output(pb: pb.standardOputput)
//    }
//    
//    return output
//}
//
//class JuBiterBitcoin {
//
//func createContext_Software(pbCfg: JUB_Proto_Bitcoin_ContextCfgBTC,
//                            masterPriInXPRV: String) -> JUB_Proto_Common_ResultInt {
//    do {
//        let cfg = inlinePb2ContextCfgBTC(pb: pbCfg)
//        var contextID = 0 as JUB_UINT16
//        let rv = JUB_CreateContextBTC_soft(cfg,
//                                           masterPriInXPRV,
//                                           &contextID)
//        return inlineResultInt2Pb(stateCode: UInt64(rv),
//                                  value: UInt32(contextID))
//    }
//}
//
//func createContext(pbCfg: JUB_Proto_Bitcoin_ContextCfgBTC,
//                   contextID: UInt) -> JUB_Proto_Common_ResultInt {
//    do {
//        let cfg = inlinePb2ContextCfgBTC(pb: pbCfg)
//        var contextID = 0 as JUB_UINT16
//        let rv = JUB_CreateContextBTC(cfg,
//                                      JUB_UINT16(contextID),
//                                      &contextID)
//        
//        return inlineResultInt2Pb(stateCode: UInt64(rv),
//                                  value: UInt32(contextID))
//    }
//}
//
//func getHDNodeBTC(contextID: UInt,
//                  pbPath: JUB_Proto_Common_Bip32Path) throws -> JUB_Proto_Common_ResultString {
//    do {
//        let path = inlinePb2Bip44Path(pb: pbPath)
//        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
//        let rv = JUB_GetHDNodeBTC(JUB_UINT16(contextID),
//                                  path,
//                                  buffer)
//        guard let ptr = buffer.pointee else {
//            throw JUB.JUBError.invalidValue
//        }
//        defer {
//            JUB_FreeMemory(ptr)
//        }
//        
//        let pubkey = String(cString: ptr)
//        return inlineResultString2Pb(stateCode: UInt64(rv),
//                                     value: pubkey)
//    }
//}
//
//func getMainHDNodeBTC(contextID: UInt) throws -> JUB_Proto_Common_ResultString {
//    do {
//        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
//        let rv = JUB_GetMainHDNodeBTC(JUB_UINT16(contextID),
//                                      buffer)
//        guard let ptr = buffer.pointee else {
//            throw JUB.JUBError.invalidValue
//        }
//        defer {
//            JUB_FreeMemory(ptr)
//        }
//        
//        let xpub = String(cString: ptr)
//        return inlineResultString2Pb(stateCode: UInt64(rv),
//                                     value: xpub)
//    }
//}
//
//func getAddressBTC(contextID: UInt,
//                   pbPath: JUB_Proto_Common_Bip32Path,
//                   bShow: Bool) throws -> JUB_Proto_Common_ResultString {
//    do {
//        let path = inlinePb2Bip44Path(pb: pbPath)
//        var show:JUB_ENUM_BOOL = BOOL_FALSE;
//        if (bShow) {
//            show = BOOL_TRUE
//        }
//        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
//        let rv = JUB_GetAddressBTC(JUB_UINT16(contextID),
//                                   path,
//                                   show,
//                                   buffer)
//        guard let ptr = buffer.pointee else {
//            throw JUB.JUBError.invalidValue
//        }
//        defer {
//            JUB_FreeMemory(ptr)
//        }
//        
//        let address = String(cString: ptr)
//        return inlineResultString2Pb(stateCode: UInt64(rv),
//                                     value: address)
//    }
//}
//
//func setMyAddressBTC(contextID: UInt,
//                     pbPath: JUB_Proto_Common_Bip32Path) throws -> JUB_Proto_Common_ResultString {
//    do {
//        let path = inlinePb2Bip44Path(pb: pbPath)
//        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
//        let rv = JUB_SetMyAddressBTC(JUB_UINT16(contextID),
//                                     path,
//                                     buffer)
//        guard let ptr = buffer.pointee else {
//            throw JUB.JUBError.invalidValue
//        }
//        defer {
//            JUB_FreeMemory(ptr)
//        }
//        
//        let address = String(cString: ptr)
//        return inlineResultString2Pb(stateCode: UInt64(rv),
//                                     value: address)
//    }
//}
//
//func signTransactionBTC(contextID: UInt,
//                        pbInputs: Google_Protobuf_Any,
//                        pbOutputs: Google_Protobuf_Any,
//                        lockTime: UInt32) throws -> JUB_Proto_Common_ResultString {
//    do {
////    JUB_RV JUB_SignTransactionBTC(IN JUB_UINT16 contextID,
////                                  IN INPUT_BTC inputs[], IN JUB_UINT16 iCount,
////                                  IN OUTPUT_BTC outputs[], IN JUB_UINT16 oCount,
////                                  IN JUB_UINT32 lockTime,
////                                  OUT JUB_CHAR_PTR_PTR raw);
////
////        var inputs:[INPUT_BTC] = []
////        var outputs:[OUTPUT_BTC] = []
////        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
////        let rv = JUB_SignTransactionBTC(JUB_UINT16(contextID),
////                                        inputs, inputs.count,
////                                        outputs, outputs.count,
////                                        lockTime,
////                                        buffer)
////        guard let ptr = buffer.pointee else {
////            throw JUB.JUBError.invalidValue
////        }
////        defer {
////            JUB_FreeMemory(ptr)
////        }
////
////        let raw = String(cString: ptr)
//        let rv = 10
//        let raw = ""
//        return inlineResultString2Pb(stateCode: UInt64(rv),
//                                     value: raw)
//    }
//}
//
//func setUnitBTC(contextID: UInt,
//                pbUnit: JUB_Proto_Bitcoin_BTC_UNIT_TYPE) -> UInt {
//    do {
//        let unit = inlinePb2EnumBTCUnitType(pb: pbUnit)
//        return JUB_SetUnitBTC(JUB_UINT16(contextID),
//                              unit)
//    }
//}
//
//func buildUSDTOutputs(contextID: UInt,
//                      USDTTo: String,
//                      amount: UInt64) -> JUB_Proto_Common_ResultAny {
//    do {
////        let outputPtr: UnsafeMutablePointer<OUTPUT_BTC>? = nil
//        let output1: OUTPUT_BTC = OUTPUT_BTC.init()
//        let output2: OUTPUT_BTC = OUTPUT_BTC.init()
//        let outputs = [output1, output2]
//        let outputPtr: UnsafeMutablePointer<OUTPUT_BTC>
//        outputPtr.assign(from: outputs, count: 2)
//        let rv = JUB_BuildUSDTOutputs(JUB_UINT16(contextID),
//                                      USDTTo,
//                                      amount,
//                                      outputPtr)
//        var googlePbInfo = Google_Protobuf_Any()
//        return inlineResultAny2Pb(stateCode: UInt64(rv),
//                                  value: [googlePbInfo])
//    }
//}
//
//func buildQRC20Outputs(contextID: UInt,
//                       contractAddr: String,
//                       decimal: UInt8,
//                       symbol: String,
//                       gasLimit: UInt64,
//                       gasPrice: UInt64,
//                       to: String,
//                       value: String) -> JUB_Proto_Common_ResultAny {
//    do {
//        let output: OUTPUT_BTC = OUTPUT_BTC.init()
//        let outputs = [output]
//        let outputPtr: UnsafeMutablePointer<OUTPUT_BTC>
//        outputPtr.assign(from: outputs, count: 1)
//        let rv = JUB_BuildQRC20Outputs(JUB_UINT16(contextID),
//                                       contractAddr,
//                                       decimal,
//                                       symbol,
//                                       gasLimit,
//                                       gasPrice,
//                                       to,
//                                       value,
//                                       outputPtr)
//        var googlePbInfo = Google_Protobuf_Any()
////        googlePbInfo.value = try inlineDeviceInfo2Pb(deviceInfo: info).serializedData()
//        return inlineResultAny2Pb(stateCode: UInt64(rv),
//                                  value: [googlePbInfo])
//    }
//}
//
//}   // class JuBiterBitcoin end
