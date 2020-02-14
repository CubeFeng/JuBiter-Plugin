//
//  JuBiterEthereum.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/13.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import JubSDKCore

class JuBiterEthereum {

internal func inlinePbToContextCfg(pb: JUB_Proto_Ethereum_ContextCfgETH) -> CONTEXT_CONFIG_ETH {
    var cfg:CONTEXT_CONFIG_ETH = CONTEXT_CONFIG_ETH.init()
    
    let buffer = UnsafeMutableBufferPointer<JUB_CHAR>.allocate(capacity: pb.mainPath.count + 1)
    defer {
        buffer.deallocate()
    }
    memcpy(buffer.baseAddress, pb.mainPath, pb.mainPath.utf8.count)
    cfg.mainPath = buffer.baseAddress
    cfg.chainID = Int32(pb.chainID)
    
    return cfg
}

func createContext_Software(pbCfg: JUB_Proto_Ethereum_ContextCfgETH,
                            masterPriInXPRV: String) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePbToContextCfg(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextETH_soft(cfg,
                                           masterPriInXPRV,
                                           &contextID)
        
        return inlineResultIntToPb(stateCode: UInt64(rv),
                                   value: UInt32(contextID))
    }
}

func createContext(pbCfg: JUB_Proto_Ethereum_ContextCfgETH,
                   deviceID: UInt) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePbToContextCfg(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextETH(cfg,
                                      JUB_UINT16(deviceID),
                                      &contextID)
        
        return inlineResultIntToPb(stateCode: UInt64(rv),
                                   value: UInt32(contextID))
    }
}

func getAddress(contextID: UInt,
                pbPath: JUB_Proto_Common_Bip44Path,
                bShow: Bool) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePbToBip44Path(pb: pbPath)
        var show:JUB_ENUM_BOOL = inlineBoolToEnumBool(bool: bShow)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_GetAddressETH(JUB_UINT16(contextID),
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

func getHDNode(contextID: UInt,
               bpFormat: JUB_Proto_Common_ENUM_PUB_FORMAT,
               pbPath: JUB_Proto_Common_Bip44Path) throws -> JUB_Proto_Common_ResultString {
    do {
        let format = inlinePbToEnumPubFormat(pb: bpFormat)
        let path = inlinePbToBip44Path(pb: pbPath)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_GetHDNodeETH(JUB_UINT16(contextID),
                                  format,
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

func getMainHDNode(contextID: UInt,
                   bpFormat: JUB_Proto_Common_ENUM_PUB_FORMAT) throws -> JUB_Proto_Common_ResultString {
    do {
        let format = inlinePbToEnumPubFormat(pb: bpFormat)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_GetMainHDNodeETH(JUB_UINT16(contextID),
                                      format,
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

func setMyAddress(contextID: UInt,
                  pbPath: JUB_Proto_Common_Bip44Path) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePbToBip44Path(pb: pbPath)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SetMyAddressETH(JUB_UINT16(contextID),
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
                     pbTx: JUB_Proto_Ethereum_TransactionETH) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePbToBip44Path(pb: pbTx.path)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SignTransactionETH(JUB_UINT16(contextID),
                                        path,
                                        JUB_UINT32(pbTx.nonce),
                                        JUB_UINT32(pbTx.gasLimit),
                                        pbTx.gasPriceInWei,
                                        pbTx.to,
                                        pbTx.valueInWei,
                                        pbTx.input,
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

func buildERC20Abi(contextID: UInt,
                   tokenName: String,
                   unitDP: UInt16,
                   contractAddress: String,
                   tokenTo: String,
                   tokenValue: String) throws -> JUB_Proto_Common_ResultString {
    do {
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_BuildERC20AbiETH(JUB_UINT16(contextID),
                                      tokenName,
                                      unitDP,
                                      contractAddress,
                                      tokenTo,
                                      tokenValue,
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
}   // class JuBiterEthereum end
