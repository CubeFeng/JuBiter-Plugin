//
//  JubSDKCommand.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/13.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import JubSDKCore

extension Array where Element == UInt8 {
    var hexaString : String {
        return self.compactMap{ String(format: "%02x", $0).uppercased()}
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



internal func inlinePb2EnumMnemonicStrength(pb: JUB_Proto_Common_ENUM_MNEMONIC_STRENGTH) -> JUB_ENUM_MNEMONIC_STRENGTH {
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

internal func inlinePb2EnumCurves(pb: JUB_Proto_Common_CURVES) -> JUB_ENUM_CURVES {
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

internal func inlinePb2Bip44Path(pb: JUB_Proto_Common_Bip32Path) -> BIP44_Path {
    var path: BIP44_Path = BIP44_Path.init()
    
    path.addressIndex = pb.addressIndex
    if (pb.change) {
        path.change = BOOL_TRUE
    }
    else {
        path.change = BOOL_FALSE
    }
    
    return path
}

class JuBiterCommon {

func generateMnemonic(pbStrength: JUB_Proto_Common_ENUM_MNEMONIC_STRENGTH) throws -> JUB_Proto_Common_ResultString {
    do {
        let strength = inlinePb2EnumMnemonicStrength(pb: pbStrength)
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
        return inlineResultString2Pb(stateCode: UInt64(rv),
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
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 64)
        defer {
            buffer.deallocate()
        }
        let rv = JUB_GenerateSeed(mnemonic,
                                  passphrase,
                                  buffer,
                                  nil)
        let array = Array(UnsafeBufferPointer(start: buffer, count: 64))
        return inlineResultString2Pb(stateCode: UInt64(rv),
                                     value: array.hexaString)
    }
}

func seedToMasterPrivateKey(seed: String, seedLen: UInt,
                            pbCurve: JUB_Proto_Common_CURVES) throws -> JUB_Proto_Common_ResultString {
    do {
        
        let curve = inlinePb2EnumCurves(pb: pbCurve)
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
        return inlineResultString2Pb(stateCode: UInt64(rv),
                                     value: prikeyInXPRV)
    }
}

}   // class JuBiterComm end
