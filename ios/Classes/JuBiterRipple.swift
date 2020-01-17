//
//  JuBiterRipple.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/31.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import JubSDKCore

class JuBiterRipple {

internal func inlinePbToEnumPaymentType(pb: JUB_Proto_Ripple_ENUM_XRP_PYMT_TYPE) -> JUB_ENUM_XRP_PYMT_TYPE {
    var pymtType: JUB_ENUM_XRP_PYMT_TYPE
    
    switch pb {
    case .dxrp:
        pymtType = DXRP
    case .fx:
        pymtType = NS_ITEM_PYMT_TYPE
    case .checks:
        pymtType = NS_ITEM_PYMT_TYPE
    case .escrow:
        pymtType = NS_ITEM_PYMT_TYPE
    case .prtl:
        pymtType = NS_ITEM_PYMT_TYPE
    case .chan:
        pymtType = NS_ITEM_PYMT_TYPE
    default:
        pymtType = NS_ITEM_PYMT_TYPE
    }
    
    return pymtType
}

internal func inlinePbToPamentAmount(pb: JUB_Proto_Ripple_PymtAmount) -> JUB_PYMT_AMOUNT {
    var pymtAmount: JUB_PYMT_AMOUNT = JUB_PYMT_AMOUNT.init()
    
    pymtAmount.currency = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.currency)
    pymtAmount.value = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.value)
    pymtAmount.issuer = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.issuer)
    
    return pymtAmount
}

internal func inlinePbToPaymentTx(pb: JUB_Proto_Ripple_PymtXRP) -> JUB_PYMT_XRP {
    var pymt: JUB_PYMT_XRP = JUB_PYMT_XRP.init()
    
    pymt.type = inlinePbToEnumPaymentType(pb: pb.type)
    pymt.amount = inlinePbToPamentAmount(pb: pb.amount)
    pymt.destination = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.destination)
    pymt.destinationTag = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.destinationTag)
    pymt.invoiceID = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.invoiceID)
    pymt.sendMax = inlinePbToPamentAmount(pb: pb.sendMax)
    pymt.deliverMin = inlinePbToPamentAmount(pb: pb.deliverMin)
    
    return pymt
}

internal func inlinePbToEnumTxType(pb: JUB_Proto_Ripple_ENUM_XRP_TX_TYPE) -> JUB_ENUM_XRP_TX_TYPE {
    var txType: JUB_ENUM_XRP_TX_TYPE
    
    switch pb {
    case .pymt:
        txType = PYMT
    default:
        txType = NS_ITEM_TX_TYPE
    }
    
    return txType
}

internal func inlinePbToTransaction(pb: JUB_Proto_Ripple_TransactionXRP) -> JUB_TX_XRP {
    var tx: JUB_TX_XRP = JUB_TX_XRP.init()
    
    tx.account = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.account)
    tx.type = inlinePbToEnumTxType(pb: pb.type)
    tx.fee = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.fee)
    tx.sequence = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.sequence)
    tx.accountTxnID = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.accountTxnID)
    tx.flags = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.flags)
    tx.lastLedgerSequence = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.lastLedgerSequence)
    tx.memos = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.memos)
    tx.sourceTag = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.sourceTag)
    
    if .pymt == pb.type {
        tx.pymt = inlinePbToPaymentTx(pb: pb.pymt)
    }
    
    return tx
}

func createContext_Software(pbCfg: JUB_Proto_Common_ContextCfg,
                            masterPriInXPRV: String) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePbToContextCfg(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextXRP_soft(cfg,
                                           masterPriInXPRV,
                                           &contextID)
        
        return inlineResultIntToPb(stateCode: UInt64(rv),
                                   value: UInt32(contextID))
    }
}

func createContext(pbCfg: JUB_Proto_Common_ContextCfg,
                   deviceID: UInt) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePbToContextCfg(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextXRP(cfg,
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
        let rv = JUB_GetAddressXRP(JUB_UINT16(contextID),
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
        let rv = JUB_GetHDNodeXRP(JUB_UINT16(contextID),
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
        let rv = JUB_GetMainHDNodeXRP(JUB_UINT16(contextID),
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
        let rv = JUB_SetMyAddressXRP(JUB_UINT16(contextID),
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
                     pbPath: JUB_Proto_Common_Bip44Path,
                     pbTx: JUB_Proto_Ripple_TransactionXRP) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePbToBip44Path(pb: pbPath)
        var tx: JUB_TX_XRP = inlinePbToTransaction(pb: pbTx)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SignTransactionXRP(JUB_UINT16(contextID),
                                        path,
                                        tx,
                                        buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let raw = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(JUBR_IMPL_NOT_SUPPORT),
                                      value: raw)
    }
}
}   // class JuBiterRipple end
