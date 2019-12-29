//
//  JuBiterEthereum.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/13.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import JubSDKCore

internal func inlinePb2ETHEnumPubFormat(pb: JUB_Proto_Ethereum_ENUM_PUB_FORMAT) -> JUB_ENUM_ETH_PUB_FORMAT {
    var format:JUB_ENUM_ETH_PUB_FORMAT
    
    switch pb {
    case .hex:
        format = HEX
    case .xpub:
        format = XPUB
    default:
        format = PUB_FORMAT_NS_ITEM
    }
    
    return format
}

internal func inlinePb2ContextCfgETH(pb: JUB_Proto_Ethereum_ContextCfgETH) -> CONTEXT_CONFIG_ETH {
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

class JuBiterEthereum {

func createContext_Software(pbCfg: JUB_Proto_Ethereum_ContextCfgETH,
                            masterPriInXPRV: String) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePb2ContextCfgETH(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextETH_soft(cfg,
                                           masterPriInXPRV,
                                           &contextID)
        return inlineResultInt2Pb(stateCode: UInt64(rv),
                                  value: UInt32(contextID))
    }
}

func createContext(pbCfg: JUB_Proto_Ethereum_ContextCfgETH,
                   deviceID: UInt) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePb2ContextCfgETH(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextETH(cfg,
                                      JUB_UINT16(deviceID),
                                      &contextID)
        
        return inlineResultInt2Pb(stateCode: UInt64(rv),
                                  value: UInt32(contextID))
    }
}

func getAddressETH(contextID: UInt,
                   pbPath: JUB_Proto_Common_Bip32Path,
                   bShow: Bool) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePb2Bip44Path(pb: pbPath)
        var show:JUB_ENUM_BOOL = BOOL_FALSE;
        if (bShow) {
            show = BOOL_TRUE
        }
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
        return inlineResultString2Pb(stateCode: UInt64(rv),
                                     value: address)
    }
}

func getHDNodeETH(contextID: UInt,
                  bpFormat: JUB_Proto_Ethereum_ENUM_PUB_FORMAT,
                  pbPath: JUB_Proto_Common_Bip32Path) throws -> JUB_Proto_Common_ResultString {
    do {
        let format = inlinePb2ETHEnumPubFormat(pb: bpFormat)
        let path = inlinePb2Bip44Path(pb: pbPath)
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
        return inlineResultString2Pb(stateCode: UInt64(rv),
                                     value: pubkey)
    }
}

func getMainHDNodeETH(contextID: UInt,
                      bpFormat: JUB_Proto_Ethereum_ENUM_PUB_FORMAT) throws -> JUB_Proto_Common_ResultString {
    do {
        let format = inlinePb2ETHEnumPubFormat(pb: bpFormat)
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
        return inlineResultString2Pb(stateCode: UInt64(rv),
                                     value: xpub)
    }
}

func setMyAddressETH(contextID: UInt,
                     pbPath: JUB_Proto_Common_Bip32Path) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePb2Bip44Path(pb: pbPath)
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
        return inlineResultString2Pb(stateCode: UInt64(rv),
                                     value: address)
    }
}

func signTransactionETH(contextID: UInt,
                        pbPath: JUB_Proto_Common_Bip32Path,
                        nonce: UInt32,
                        gasLimit: UInt32,
                        gasPriceInWei: String,
                        to: String,
                        valueInWei: String,
                        input: String) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePb2Bip44Path(pb: pbPath)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SignTransactionETH(JUB_UINT16(contextID),
                                        path,
                                        nonce,
                                        gasLimit,
                                        gasPriceInWei,
                                        to,
                                        valueInWei,
                                        input,
                                        buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let raw = String(cString: ptr)
        return inlineResultString2Pb(stateCode: UInt64(rv),
                                     value: raw)
    }
}

func buildERC20AbiETH(contextID: UInt,
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
        return inlineResultString2Pb(stateCode: UInt64(rv),
                                     value: raw)
    }
}

}   // class JuBiterEthereum end
