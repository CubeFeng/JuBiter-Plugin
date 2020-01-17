//
//  JubSDK.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/13.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import SwiftProtobuf
import JubSDKCore

enum JUB {}
extension JUB {
    enum JUBError: Error {
        case invalidParam
        case invalidValue
        case code(JUB_RV)
        case pinRemain(UInt)
        case pinLocked
    }
}

internal func inlineResultIntToPb(stateCode: UInt64,
                                  value: UInt32) -> JUB_Proto_Common_ResultInt {
    var result =  JUB_Proto_Common_ResultInt()
    
    result.stateCode = stateCode
    result.value = value
    
    return result
}

internal func inlineResultStringToPb(stateCode: UInt64,
                                     value: String) -> JUB_Proto_Common_ResultString {
    var result =  JUB_Proto_Common_ResultString()
    
    result.stateCode = stateCode
    result.value = value
    
    return result
}

internal func inlineResultAnyToPb(stateCode: UInt64,
                                  value: [SwiftProtobuf.Google_Protobuf_Any]) -> JUB_Proto_Common_ResultAny {
    var result =  JUB_Proto_Common_ResultAny()
    
    result.stateCode = stateCode
    result.value = value
    
    return result
}
