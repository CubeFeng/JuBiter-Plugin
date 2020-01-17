//
//  JuBiterHcash.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2020/01/03.
//  Copyright © 2020 JuBiter. All rights reserved.
//

import Foundation
import SwiftProtobuf
import JubSDKCore

class JuBiterHcash {

internal func inlinePbToInput(pb: JUB_Proto_Hcash_InputHC) -> INPUT_HC {
    return INPUT_HC(amount: JUB_UINT64(pb.amount),
                    path: inlinePbToBip44Path(pb: pb.path))
}

internal func inlinePbToOutput(pb: JUB_Proto_Hcash_OutputHC) -> OUTPUT_HC {
    var output: OUTPUT_HC = OUTPUT_HC.init()
    
    output.changeAddress = inlineBoolToEnumBool(bool: pb.changeAddress)
    output.path = inlinePbToBip44Path(pb: pb.path)
    
    return output
}

func createContext(pbCfg: JUB_Proto_Common_ContextCfg,
                   contextID: UInt) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePbToContextCfg(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextHC(cfg,
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
        let rv = JUB_GetHDNodeHC(JUB_UINT16(contextID),
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
        let rv = JUB_GetMainHDNodeHC(JUB_UINT16(contextID),
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
        let rv = JUB_GetAddressHC(JUB_UINT16(contextID),
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

func signTransaction(contextID: UInt,
                     pbTx: JUB_Proto_Hcash_TransactionHC,
                     unsignedTrans: String) throws -> JUB_Proto_Common_ResultString {
    do {
        var inputs:[INPUT_HC] = []
        let inputPtr = UnsafeMutablePointer<INPUT_HC>.allocate(capacity: pbTx.inputs.count)
        inputPtr.assign(from: inputs, count: pbTx.inputs.count)
        defer {
            inputPtr.deallocate()
        }
        for n in 0...pbTx.inputs.count {
            inputs[n] = inlinePbToInput(pb: pbTx.inputs[n])
        }
        
        var outputs:[OUTPUT_HC] = []
        let outputPtr = UnsafeMutablePointer<OUTPUT_HC>.allocate(capacity: pbTx.outputs.count)
        outputPtr.assign(from: outputs, count: pbTx.outputs.count)
        defer {
            outputPtr.deallocate()
        }
        for n in 0...pbTx.outputs.count {
            outputs[n] = inlinePbToOutput(pb: pbTx.outputs[n])
        }
        
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SignTransactionHC(JUB_UINT16(contextID),
                                       inputPtr, JUB_UINT16(pbTx.inputs.count),
                                       outputPtr, JUB_UINT16(pbTx.outputs.count),
                                       unsignedTrans,
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
}   // class JuBiterBitcoin end
