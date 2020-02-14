//
//  JuBiterBitcoin.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/13.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import SwiftProtobuf
import JubSDKCore

class JuBiterBitcoin {

internal func inlinePbToEnumCoinType(pb: JUB_Proto_Bitcoin_ENUM_COIN_TYPE_BTC) -> JUB_ENUM_COINTYPE_BTC {
    var coinType:JUB_ENUM_COINTYPE_BTC
    
    switch pb {
    case .coinbtc:
        coinType = COINBTC
    case .coinbch:
        coinType = COINBCH
    case .coinltc:
        coinType = COINLTC
    case .coinusdt:
        coinType = COINUSDT
    case .coindash:
        coinType = COINDASH
    case .coinqtum:
        coinType = COINQTUM
    default:
        coinType = COINBTC
    }
    
    return coinType
}

internal func inlinePbToEnumTransType(pb: JUB_Proto_Bitcoin_ENUM_TRAN_STYPE_BTC) -> JUB_ENUM_BTC_TRANS_TYPE {
    var transType:JUB_ENUM_BTC_TRANS_TYPE
    
    switch pb {
    case .p2Pk:
        transType = p2pkh
    case .p2Pkh:
        transType = p2pkh
    case .p2ShP2Wpkh:
        transType = p2sh_p2wpkh
    case .p2ShMultisig:
        transType = trans_type_ns_item
    default:
        transType = trans_type_ns_item
    }
    
    return transType
}

internal func inlinePbToEnumScriptType(pb: JUB_Proto_Bitcoin_ENUM_SCRIPT_TYPE_BTC) -> JUB_ENUM_SCRIPT_BTC_TYPE {
    var scriptType:JUB_ENUM_SCRIPT_BTC_TYPE
    
    switch pb {
    case .scP2Pkh:
        scriptType = P2PKH
    case .scReturn0:
        scriptType = RETURN0
    case .scQrc20:
        scriptType = QRC20
    default:
        scriptType = P2PKH
    }
    
    return scriptType
}

internal func inlinePbToEnumUnitType(pb: JUB_Proto_Bitcoin_BTC_UNIT_TYPE) -> JUB_ENUM_BTC_UNIT_TYPE {
    var unitType: JUB_ENUM_BTC_UNIT_TYPE
    
    switch pb {
    case .btc:
        unitType = BTC
    case .cBtc:
        unitType = cBTC
    case .mBtc:
        unitType = mBTC
    case .uBtc:
        unitType = uBTC
    case .satoshi:
        unitType = Satoshi
    default:
        unitType = ns
    }
    
    return unitType
}

internal func inlinePbToContextCfg(pb: JUB_Proto_Bitcoin_ContextCfgBTC) -> CONTEXT_CONFIG_BTC {
    return CONTEXT_CONFIG_BTC(mainPath: UnsafeMutablePointer<JUB_CHAR>(mutating: pb.mainPath),
                              coinType: inlinePbToEnumCoinType(pb: pb.coinType),
                              transType: inlinePbToEnumTransType(pb: pb.transType))
}

internal func inlinePbToInput(pb: JUB_Proto_Bitcoin_InputBTC) -> INPUT_BTC {
    return INPUT_BTC(type: inlinePbToEnumScriptType(pb: .scP2Pkh),
                     preHash: UnsafeMutablePointer<JUB_CHAR>(mutating: pb.preHash),
                     preIndex: JUB_UINT16(pb.preIndex),
                     nSequence: JUB_UINT32(0xFFFFFFFF),
                     amount: JUB_UINT64(pb.amount),
                     path: inlinePbToBip44Path(pb: pb.path))
}

internal func inlineOutputToPb(output: OUTPUT) -> JUB_Proto_Bitcoin_StandardOutput {
    var pb = JUB_Proto_Bitcoin_StandardOutput()
    
    pb.address = withUnsafePointer(to: output.address) {
        $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: output.address)) {
            String(cString: $0)
        }
    }
    pb.amount = UInt64(output.amount)
    pb.changeAddress = inlineEnumBoolToBool(enumBool: output.changeAddress)
    pb.path = inlineBip44PathToPb(path: output.path)
    
    return pb
}

internal func inlinePbToStdOutput(pb: JUB_Proto_Bitcoin_StandardOutput) -> OUTPUT {
    var output: OUTPUT = OUTPUT.init()
    
    output.address = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.address)
    output.amount = pb.amount
    output.changeAddress = inlineBoolToEnumBool(bool: pb.changeAddress)
    output.path = inlinePbToBip44Path(pb: pb.path)
    
    return output
}

internal func inlineOutputReturn0ToPb(output: OUTPUT_RETURN0) -> JUB_Proto_Bitcoin_Return0Output {
    var pb = JUB_Proto_Bitcoin_Return0Output()
    
    pb.amount = UInt64(output.amount)
    pb.data = withUnsafePointer(to: output.data) {
        $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: output.data)) {
            String(cString: $0)
        }
    }
    
    return pb
}

internal func inlinePb2OutputReturn0(pb: JUB_Proto_Bitcoin_Return0Output) -> OUTPUT_RETURN0 {
    var output: OUTPUT_RETURN0 = OUTPUT_RETURN0.init()
    
    output.amount  = JUB_UINT64(pb.amount)
    
    output.dataLen = JUB_UINT16(pb.data.count)
    var data = withUnsafeBytes(of: output.data) {
        Array($0.bindMemory(to: UInt8.self))
    }
    memcpy(&data, pb.data, pb.data.count)
    
    return output
}

internal func inlineOutputQrc20ToPb(output: OUTPUT_QRC20) -> JUB_Proto_Bitcoin_QRC20Output {
    var pb = JUB_Proto_Bitcoin_QRC20Output()
    
    pb.data = withUnsafePointer(to: output.data) {
        $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: output.data)) {
            String(cString: $0)
        }
    }
    
    return pb
}

internal func inlinePb2OutputQrc20(pb: JUB_Proto_Bitcoin_QRC20Output) -> OUTPUT_QRC20 {
    var output: OUTPUT_QRC20 = OUTPUT_QRC20.init()
    
    output.dataLen = JUB_UINT16(pb.data.count)
    var data = withUnsafeBytes(of: output.data) {
        Array($0.bindMemory(to: UInt8.self))
    }
    memcpy(&data, pb.data, pb.data.count)
    
    return output
}

internal func inlinePbToOutput(pb: JUB_Proto_Bitcoin_OutputBTC) -> OUTPUT_BTC {
    var output: OUTPUT_BTC = OUTPUT_BTC.init()
    
    switch pb.type {
    case .scP2Pkh:
        output.type = P2PKH
        output.stdOutput = inlinePbToStdOutput(pb: pb.stdOutput)
    case .scReturn0:
        output.type = RETURN0
        output.return0 = inlinePb2OutputReturn0(pb: pb.return0Output)
    case .scQrc20:
        output.type = QRC20
        output.qrc20 = inlinePb2OutputQrc20(pb: pb.qrc20Output)
    default:
        output.stdOutput = inlinePbToStdOutput(pb: pb.stdOutput)
    }
    
    return output
}

internal func inlineOutputToPb(output: OUTPUT_BTC) -> JUB_Proto_Bitcoin_OutputBTC {
    var pb = JUB_Proto_Bitcoin_OutputBTC()
    
    switch output.type {
    case P2PKH:
        pb.type = .scP2Pkh
        pb.stdOutput = inlineOutputToPb(output: output.stdOutput)
        break
    case RETURN0:
        pb.type = .scReturn0
        pb.return0Output = inlineOutputReturn0ToPb(output: output.return0)
        break
    case QRC20:
        pb.type = .scQrc20
        pb.qrc20Output = inlineOutputQrc20ToPb(output: output.qrc20)
        break
    default:
        pb.type = .scP2Pkh
        break
    }
    
    return pb
}

func createContext_Software(pbCfg: JUB_Proto_Bitcoin_ContextCfgBTC,
                            masterPriInXPRV: String) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePbToContextCfg(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextBTC_soft(cfg,
                                           masterPriInXPRV,
                                           &contextID)
        
        return inlineResultIntToPb(stateCode: UInt64(rv),
                                   value: UInt32(contextID))
    }
}

func createContext(pbCfg: JUB_Proto_Bitcoin_ContextCfgBTC,
                   contextID: UInt) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePbToContextCfg(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextBTC(cfg,
                                      JUB_UINT16(contextID),
                                      &contextID)
        
        return inlineResultIntToPb(stateCode: UInt64(rv),
                                   value: UInt32(contextID))
    }
}

func getHDNode(contextID: UInt,
               pbPath: JUB_Proto_Common_Bip44Path) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePbToBip44Path(pb: pbPath)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_GetHDNodeBTC(JUB_UINT16(contextID),
                                  path,
                                  buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let pubkey = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: pubkey)
    }
}

func getMainHDNode(contextID: UInt) throws -> JUB_Proto_Common_ResultString {
    do {
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_GetMainHDNodeBTC(JUB_UINT16(contextID),
                                      buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let xpub = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: xpub)
    }
}

func getAddress(contextID: UInt,
                pbPath: JUB_Proto_Common_Bip44Path,
                bShow: Bool) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePbToBip44Path(pb: pbPath)
        var show:JUB_ENUM_BOOL = inlineBoolToEnumBool(bool: bShow)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_GetAddressBTC(JUB_UINT16(contextID),
                                   path,
                                   show,
                                   buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let address = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: address)
    }
}

func setMyAddress(contextID: UInt,
                  pbPath: JUB_Proto_Common_Bip44Path) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePbToBip44Path(pb: pbPath)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SetMyAddressBTC(JUB_UINT16(contextID),
                                     path,
                                     buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let address = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: address)
    }
}

func signTransaction(contextID: UInt,
                     pbTx: JUB_Proto_Bitcoin_TransactionBTC) throws -> JUB_Proto_Common_ResultString {
    do {
        var inputs:[INPUT_BTC] = []
        let inputPtr = UnsafeMutablePointer<INPUT_BTC>.allocate(capacity: pbTx.inputs.count)
        inputPtr.assign(from: inputs, count: pbTx.inputs.count)
        defer {
            inputPtr.deallocate()
        }
        for n in 0...pbTx.inputs.count {
            inputs[n] = inlinePbToInput(pb: pbTx.inputs[n])
        }
        
        var outputs:[OUTPUT_BTC] = []
        let outputPtr = UnsafeMutablePointer<OUTPUT_BTC>.allocate(capacity: pbTx.outputs.count)
        outputPtr.assign(from: outputs, count: pbTx.outputs.count)
        defer {
            outputPtr.deallocate()
        }
        for n in 0...pbTx.outputs.count {
            outputs[n] = inlinePbToOutput(pb: pbTx.outputs[n])
        }
        
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SignTransactionBTC(JUB_UINT16(contextID),
                                        inputPtr, JUB_UINT16(pbTx.inputs.count),
                                        outputPtr, JUB_UINT16(pbTx.outputs.count),
                                        JUB_UINT32(pbTx.locktime),
                                        buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let raw = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: raw)
    }
}

func setUnit(contextID: UInt,
             pbUnit: JUB_Proto_Bitcoin_BTC_UNIT_TYPE) -> UInt {
    do {
        let unit = inlinePbToEnumUnitType(pb: pbUnit)
        return JUB_SetUnitBTC(JUB_UINT16(contextID),
                              unit)
    }
}

func buildUSDTOutputs(contextID: UInt,
                      USDTTo: String,
                      amount: UInt64) -> JUB_Proto_Common_ResultAny {
    do {
        let output1: OUTPUT_BTC = OUTPUT_BTC.init()
        let output2: OUTPUT_BTC = OUTPUT_BTC.init()
        let outputs = [output1, output2]
        let buffer = UnsafeMutablePointer<OUTPUT_BTC>.allocate(capacity: 2)
        buffer.assign(from: outputs, count: 2)
        defer {
            buffer.deallocate()
        }
        let rv = JUB_BuildUSDTOutputs(JUB_UINT16(contextID),
                                      USDTTo,
                                      amount,
                                      buffer)
        
        let usdtOutput1 = try Google_Protobuf_Any(message: inlineOutputToPb(output: outputs[0]))
        let usdtOutput2 = try Google_Protobuf_Any(message: inlineOutputToPb(output: outputs[1]))
        return inlineResultAnyToPb(stateCode: UInt64(rv),
                                   value: [usdtOutput1, usdtOutput2])
    }
    catch {
        return JUB_Proto_Common_ResultAny()
    }
}

func buildQRC20Outputs(contextID: UInt,
                       contractAddr: String,
                       decimal: UInt8,
                       symbol: String,
                       gasLimit: UInt64,
                       gasPrice: UInt64,
                       to: String,
                       value: String) -> JUB_Proto_Common_ResultAny {
    do {
        let output: OUTPUT_BTC = OUTPUT_BTC.init()
        let outputs = [output]
        let buffer = UnsafeMutablePointer<OUTPUT_BTC>.allocate(capacity: 1)
        buffer.assign(from: outputs, count: 1)
        defer {
            buffer.deallocate()
        }
        let rv = JUB_BuildQRC20Outputs(JUB_UINT16(contextID),
                                       contractAddr,
                                       decimal,
                                       symbol,
                                       gasLimit,
                                       gasPrice,
                                       to,
                                       value,
                                       buffer)
        
        let qrc20Output = try Google_Protobuf_Any(message: inlineOutputToPb(output: outputs[0]))
        return inlineResultAnyToPb(stateCode: UInt64(rv),
                                   value: [qrc20Output])
    }
    catch {
        return JUB_Proto_Common_ResultAny()
    }
}
}   // class JuBiterBitcoin end
