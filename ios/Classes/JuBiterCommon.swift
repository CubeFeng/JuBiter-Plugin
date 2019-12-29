//
//  JubSDKCommand.swift
//  JubSDKProtobuf
//
//  Created by Pan Min on 2019/12/13.
//  Copyright © 2019 JuBiter. All rights reserved.
//

import Foundation
import JubSDKCore

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
        let buffer = UnsafeMutablePointer<JUB_BYTE>.allocate(capacity: 64)
        defer {
            buffer.deallocate()
        }
        let rv = JUB_GenerateSeed(mnemonic,
                                  passphrase,
                                  buffer,
                                  nil)
        let seed = String(cString: buffer)
        return inlineResultString2Pb(stateCode: UInt64(rv),
                                     value: seed)
    }
}

func seedToMasterPrivateKey(seed: String, seedLen: UInt,
                            pbCurve: JUB_Proto_Common_CURVES) throws -> JUB_Proto_Common_ResultString {
    do {
        
        let curve = inlinePb2EnumCurves(pb: pbCurve)
        let buffer = JUB_CHAR_PTR_PTR.allocate(capacity: 1)
        let rv = JUB_SeedToMasterPrivateKey(seed, JUB_UINT16(seedLen),
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
