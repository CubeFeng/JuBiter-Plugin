//
//  JuBiterWallet.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/13.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import SwiftProtobuf
import JubSDKCore

class JuBiterWallet {

internal func inlineDeviceInfoToPb(deviceInfo: JUB_DEVICE_INFO) -> JUB_Proto_Common_DeviceInfo {
    var pb = JUB_Proto_Common_DeviceInfo()
    
    pb.label = withUnsafePointer(to: deviceInfo.label) {
        $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: deviceInfo.label)) {
            String(cString: $0)
        }
    }
    pb.sn = withUnsafePointer(to: deviceInfo.sn) {
        $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: deviceInfo.sn)) {
            String(cString: $0)
        }
    }
    pb.pinRetry = UInt32(deviceInfo.pinRetry)
    pb.pinMaxRetry = UInt32(deviceInfo.pinMaxRetry)
    pb.bleVersion = withUnsafePointer(to: deviceInfo.bleVersion) {
        $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: deviceInfo.bleVersion)) {
            String(cString: $0)
        }
    }
    pb.firmwareVersion = withUnsafePointer(to: deviceInfo.firmwareVersion) {
        $0.withMemoryRebound(to: UInt8.self, capacity: MemoryLayout.size(ofValue: deviceInfo.firmwareVersion)) {
            String(cString: $0)
        }
    }
    
    return pb;
}

func getDeviceInfo(contextID: UInt) -> JUB_Proto_Common_ResultAny {
    do {
        var devInfo: JUB_DEVICE_INFO = JUB_DEVICE_INFO.init()
        let rv = JUB_GetDeviceInfo(JUB_UINT16(contextID),
                                   &devInfo)
        
        let deviceInfo = try Google_Protobuf_Any(message: inlineDeviceInfoToPb(deviceInfo: devInfo))
        return inlineResultAnyToPb(stateCode: UInt64(rv),
                                   value: [deviceInfo])
    }
    catch {
        return JUB_Proto_Common_ResultAny()
    }
}

func getDeviceCert(contextID: UInt) throws -> JUB_Proto_Common_ResultString {
    do {
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_GetDeviceCert(JUB_UINT16(contextID),
                                   buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let cert = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: cert)
    }
}

func sendOneApdu(deviceID: UInt,
                 apdu: String) throws -> JUB_Proto_Common_ResultString {
    do {
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SendOneApdu(JUB_UINT16(deviceID),
                                 apdu,
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

func isInitialize(contextID: UInt) -> Bool {
    do {
        return inlineEnumBoolToBool(enumBool: JUB_IsInitialize(JUB_UINT16(contextID)))
    }
}

func isBootLoader(contextID: UInt) -> Bool {
    do {
        return inlineEnumBoolToBool(enumBool: JUB_IsBootLoader(JUB_UINT16(contextID)))
    }
}

func setTimeOut(contextID: UInt,
                timeout: UInt) -> UInt {
    do {
        JUB_SetTimeOut(JUB_UINT16(contextID),
                       JUB_UINT16(timeout))
        return UInt(JUBR_OK)
    }
}

func enumApplets(contextID: UInt) throws -> JUB_Proto_Common_ResultString {
    do {
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_EnumApplets(JUB_UINT16(contextID),
                                 buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let appList = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: appList)
    }
}

func enumSupportCoins(contextID: UInt) throws -> JUB_Proto_Common_ResultString {
    do {
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = Jub_EnumSupportCoins(JUB_UINT16(contextID),
                                      buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let coinsList = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: coinsList)
    }
}

func getAppletVersion(deviceID: UInt,
                      appID: String) throws -> JUB_Proto_Common_ResultString {
    do {
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_GetAppletVersion(JUB_UINT16(deviceID),
                                      appID,
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

func clearContext(contextID: UInt) -> UInt {
    do {
        return JUB_ClearContext(JUB_UINT16(contextID))
    }
}

func showVirtualPwd(contextID: UInt) -> UInt {
    do {
        return JUB_ShowVirtualPwd(JUB_UINT16(contextID))
    }
}

func cancelVirtualPwd(contextID: UInt) -> UInt {
    do {
        return JUB_CancelVirtualPwd(JUB_UINT16(contextID))
    }
}

func verifyPIN(contextID: UInt,
               pinMin: String) -> JUB_Proto_Common_ResultInt {
    do {
        var retry = 0 as JUB_ULONG
        let rv = JUB_VerifyPIN(JUB_UINT16(contextID),
                               pinMin,
                               &retry)
        
        return inlineResultIntToPb(stateCode: UInt64(rv),
                                   value: UInt32(retry))
    }
}

func queryBattery(contextID: UInt) -> JUB_Proto_Common_ResultInt{
    
     do {
           var battry = 0 as UInt8
           let rv = JUB_QueryBattery(JUB_UINT16(contextID), &battry)
           
           return inlineResultIntToPb(stateCode: UInt64(rv),
                                         value: UInt32(battry))
       }
}
    
}   // class JuBiterWallet end
