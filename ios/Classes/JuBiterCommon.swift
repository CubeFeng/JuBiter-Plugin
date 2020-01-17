//
//  JubSDKCommand.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/13.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import JubSDKCore

internal func inlineEnumBoolToBool(enumBool: JUB_ENUM_BOOL) -> Bool {
    let b:Bool
    
    if BOOL_FALSE == enumBool {
        b = false
    }
    else {
        b = true
    }
    
    return b
}

internal func inlineBoolToEnumBool(bool: Bool) -> JUB_ENUM_BOOL {
    let b:JUB_ENUM_BOOL
    
    if false == bool {
        b = BOOL_FALSE
    }
    else {
        b = BOOL_TRUE
    }
    
    return b
}

internal func inlineBip44PathToPb(path: BIP44_Path) -> JUB_Proto_Common_Bip44Path {
    var pb = JUB_Proto_Common_Bip44Path()
    
    pb.change = inlineEnumBoolToBool(enumBool: path.change)
    pb.addressIndex = UInt64(path.addressIndex)
    
    return pb
}

internal func inlinePbToBip44Path(pb: JUB_Proto_Common_Bip44Path) -> BIP44_Path {
    var path: BIP44_Path = BIP44_Path.init()
    
    path.addressIndex = pb.addressIndex
    path.change = inlineBoolToEnumBool(bool: pb.change)
    
    return path
}

internal func inlinePbToEnumPubFormat(pb: JUB_Proto_Common_ENUM_PUB_FORMAT) -> JUB_ENUM_PUB_FORMAT {
    var format:JUB_ENUM_PUB_FORMAT
    
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

internal func inlinePbToContextCfg(pb: JUB_Proto_Common_ContextCfg) -> CONTEXT_CONFIG {
    var cfg:CONTEXT_CONFIG = CONTEXT_CONFIG.init()
    
    let buffer = UnsafeMutableBufferPointer<JUB_CHAR>.allocate(capacity: pb.mainPath.count + 1)
    defer {
        buffer.deallocate()
    }
    memcpy(buffer.baseAddress, pb.mainPath, pb.mainPath.utf8.count)
    cfg.mainPath = buffer.baseAddress
    
    return cfg
}

extension Array where Element == UInt8 {
    var hexaString: String {
        return self.compactMap {String(format: "%02x", $0).uppercased()}
        .joined(separator: "")
    }
}

extension String {
    var hexaBytes: [UInt8] {
        var position = startIndex
        return (0..<count/2).compactMap { _ in    // for Swift 4.1 or later use compactMap instead of flatMap
            defer { position = index(position,offsetBy: 2) }
            return UInt8(self[position...index(after: position)],radix: 16)
        }
    }
    var hexaData: Data { return hexaBytes.data }
}

extension Collection where Element == UInt8 {
    var data: Data {
        return Data(self)
    }
    var hexa: String {
        return map{ String(format: "%02X",$0) }.joined()
    }
}

class JuBiterCommon {

internal func inlinePbToEnumMnemonicStrength(pb: JUB_Proto_Common_ENUM_MNEMONIC_STRENGTH) -> JUB_ENUM_MNEMONIC_STRENGTH {
    var strength: JUB_ENUM_MNEMONIC_STRENGTH
    
    switch pb {
    case .strength128:
        strength = STRENGTH128
    case .strength192:
        strength = STRENGTH192
    case .strength256:
        strength = STRENGTH256
    default:
        strength = STRENGTH128
    }
    
    return strength
}

internal func inlinePbToEnumCurves(pb: JUB_Proto_Common_CURVES) -> JUB_ENUM_CURVES {
    var curve: JUB_ENUM_CURVES
    
    switch pb {
    case .secp256K1:
        curve = secp256k1
    case .ed25519:
        curve = ed25519
    case .nist256P1:
        curve = nist256p1
    default:
        curve = secp256k1
    }
    
    return curve
}

func generateMnemonic(pbStrength: JUB_Proto_Common_ENUM_MNEMONIC_STRENGTH) throws -> JUB_Proto_Common_ResultString {
    do {
        let strength = inlinePbToEnumMnemonicStrength(pb: pbStrength)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_GenerateMnemonic(strength,
                                      buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let mnemonic = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: mnemonic)
    }
}

func checkMnemonic(mnemonic: String) -> UInt {
    do {
        return JUB_CheckMnemonic(mnemonic)
    }
}

func generateSeed(mnemonic: String,
                  passphrase: String) -> JUB_Proto_Common_ResultString {
    do {
        let buffer = UnsafeMutablePointer<JUB_BYTE>.allocate(capacity: 64)
        defer {
            buffer.deallocate()
        }
        let rv = JUB_GenerateSeed(mnemonic,
                                  passphrase,
                                  buffer,
                                  nil)
        
        let seed = Array(UnsafeBufferPointer(start: buffer,
                                             count: 64))
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: seed.hexaString)
    }
}

func seedToMasterPrivateKey(seed: String, seedLen: UInt,
                            pbCurve: JUB_Proto_Common_CURVES) throws -> JUB_Proto_Common_ResultString {
    do {
        let curve = inlinePbToEnumCurves(pb: pbCurve)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let bytes: [UInt8] = seed.hexaBytes
        
        let pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: 64)
        pointer.initialize(from: bytes, count: 64)
        let rv = JUB_SeedToMasterPrivateKey(pointer, JUB_UINT16(64),
                                            curve,
                                            buffer)
        guard let ptr = buffer.pointee else {
            throw JUB.JUBError.invalidValue
        }
        defer {
            JUB_FreeMemory(ptr)
        }
        
        let prikeyInXPRV = String(cString: ptr)
        return inlineResultStringToPb(stateCode: UInt64(rv),
                                      value: prikeyInXPRV)
    }
}

func getVersion() throws -> JUB_Proto_Common_ResultString {
    do {
        let ver = JUB_GetVersion()
        let buffer = UnsafeMutablePointer<JUB_BYTE>.allocate(capacity: 20)
        defer {
            buffer.deallocate()
        }
        memcpy(buffer, ver, 20)
        
        let version = String(cString: buffer)
        return inlineResultStringToPb(stateCode: UInt64(JUBR_OK),
                                      value: version)
    }
}
}   // class JuBiterComm end
