//
//  JuBiterEOS.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/31.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import JubSDKCore

class JuBiterEOS {

internal func inlinePbToEnumActionType(pb: JUB_Proto_EOS_ENUM_EOS_ACTION_TYPE) -> JUB_ENUM_EOS_ACTION_TYPE {
    var actionType: JUB_ENUM_EOS_ACTION_TYPE
    
    switch pb {
    case .xfer:
        actionType = XFER
    case .dele:
        actionType = DELE
    case .undele:
        actionType = UNDELE
    case .buyram:
        actionType = BUYRAM
    case .sellram:
        actionType = SELLRAM
    default:
        actionType = NS_ITEM_EOS_ACTION_TYPE
    }
    
    return actionType
}

internal func inlinePbToXferAction(pb: JUB_Proto_EOS_TransferAction) -> JUB_ACTION_TRANSFER {
    var action: JUB_ACTION_TRANSFER = JUB_ACTION_TRANSFER.init()
    
    action.from = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.from)
    action.to = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.to)
    action.asset = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.asset)
    action.memo = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.memo)
    
    return action
}

internal func inlinePbToDeleAction(pb: JUB_Proto_EOS_DelegateAction) -> JUB_ACTION_DELEGATE {
    var action: JUB_ACTION_DELEGATE = JUB_ACTION_DELEGATE.init()
    
    action.from = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.from)
    action.receiver = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.receiver)
    action.netQty = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.netQty)
    action.cpuQty = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.cpuQty)
    action.bStake = pb.stake
    
    return action
}

internal func inlinePbToBuyRamAction(pb: JUB_Proto_EOS_BuyRamAction) -> JUB_ACTION_BUYRAM {
    var action: JUB_ACTION_BUYRAM = JUB_ACTION_BUYRAM.init()
    
    action.payer = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.payer)
    action.quant = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.quant)
    action.receiver = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.receiver)
    
    return action
}

internal func inlinePbToSellRamAction(pb: JUB_Proto_EOS_SellRamAction) -> JUB_ACTION_SELLRAM {
    var action: JUB_ACTION_SELLRAM = JUB_ACTION_SELLRAM.init()
    
    action.account = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.account)
    action.bytes = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.byte)
    
    return action
}

internal func inlinePbToAction(pb: JUB_Proto_EOS_ActionEOS) -> JUB_ACTION_EOS {
    var action: JUB_ACTION_EOS = JUB_ACTION_EOS.init()
    
    action.type = inlinePbToEnumActionType(pb: pb.type)
    action.currency = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.currency)
    action.name = UnsafeMutablePointer<JUB_CHAR>(mutating: pb.name)
    
    switch pb.type {
        case .xfer:
            action.transfer = inlinePbToXferAction(pb: pb.xferAction)
        case .dele:
            action.delegate = inlinePbToDeleAction(pb: pb.deleAction)
        case .undele:
            action.delegate = inlinePbToDeleAction(pb: pb.deleAction)
        case .buyram:
            action.buyRam = inlinePbToBuyRamAction(pb: pb.buyRamAction)
        case .sellram:
            action.sellRam = inlinePbToSellRamAction(pb: pb.sellRamAction)
        default:
            break
    }
    
    return action
}

func createContext_Software(pbCfg: JUB_Proto_Common_ContextCfg,
                            masterPriInXPRV: String) -> JUB_Proto_Common_ResultInt {
    do {
        let cfg = inlinePbToContextCfg(pb: pbCfg)
        var contextID = 0 as JUB_UINT16
        let rv = JUB_CreateContextEOS_soft(cfg,
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
        let rv = JUB_CreateContextEOS(cfg,
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
        let rv = JUB_GetAddressEOS(JUB_UINT16(contextID),
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
                     pbPath: JUB_Proto_Common_Bip44Path,
                     chainID: String,
                     expiration: String,
                     referenceBlockId: String,
                     referenceBlockTime: String,
                     actionsInJSON: String) throws -> JUB_Proto_Common_ResultString {
    do {
        let path = inlinePbToBip44Path(pb: pbPath)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SignTransactionEOS(JUB_UINT16(contextID),
                                        path,
                                        chainID,
                                        expiration,
                                        referenceBlockId,
                                        referenceBlockTime,
                                        actionsInJSON,
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

func buildAction(contextID: UInt,
                 actions: [JUB_Proto_EOS_ActionEOS],
                 actionCount: UInt16) throws -> JUB_Proto_Common_ResultString {
    do {
        var acts:[JUB_ACTION_EOS] = []
        let actionsPtr = UnsafeMutablePointer<JUB_ACTION_EOS>.allocate(capacity: Int(actionCount))
        actionsPtr.assign(from: acts, count: Int(actionCount))
        defer {
            actionsPtr.deallocate()
        }
        for n in 0...Int(actionCount) {
            acts[n] = inlinePbToAction(pb: actions[n])
        }
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_BuildActionEOS(JUB_UINT16(contextID),
                                    actionsPtr,
                                    actionCount,
                                    buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let actionsInJSON = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(JUBR_IMPL_NOT_SUPPORT),
                                      value: actionsInJSON)
    }
}
}   // class JuBiterEOS end
