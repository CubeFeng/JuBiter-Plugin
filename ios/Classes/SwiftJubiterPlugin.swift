import Flutter
import UIKit
import CoreBluetooth
import JubSDKCore

private let  nbsp = "\u{202f}"
private let  TAG  = "JuBiterPlugin";
private let  NAMESPACE  = "com.jubiter.plugin";
private let  REQUEST_COARSE_LOCATION_PERMISSIONS = 1452;
private let  METHOD_CHANNEL_NAME =  NAMESPACE + "/methods";
private let  EVENT_SCAN_RESULT_CHANNEL  = NAMESPACE + "/scanResult";
private let  EVENT_CONNECT_STATE_CHANNEL =  NAMESPACE + "/state";


enum Notif {
       static let arrival = Notification.Name("device.arrival")
       static let disconnect = Notification.Name("device.disconnect")
}

public class SwiftJuBiterPlugin: NSObject, FlutterPlugin {
        
    var central = CBCentralManager()
    
    var available: Bool {
        return central.state == .poweredOn || central.state == .unknown
    }
    
    var pendingCall: FlutterMethodCall?
    var pendingResult: FlutterResult?
    var eventChannel: FlutterEventChannel?
    var methodChannel: FlutterMethodChannel?
    var eventSink: FlutterEventSink?
    var devices : [String : BluetoothDevice] = [:]
    
    
    convenience init(with registrar: FlutterPluginRegistrar){
        self.init()
        
        print("创建SwiftJuBiterPlugin实例")

        eventChannel = FlutterEventChannel(name: EVENT_SCAN_RESULT_CHANNEL, binaryMessenger: registrar.messenger())
          
        eventChannel!.setStreamHandler(self)
        
        central.delegate = self
               
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(deviceArrivalObserver(_:)), name: Notif.arrival, object: nil)
    
        methodChannel = FlutterMethodChannel(name: METHOD_CHANNEL_NAME, binaryMessenger: registrar.messenger())
        
        registrar.addMethodCallDelegate(self, channel: methodChannel!)
    }
     
    
    public static func register(with registrar: FlutterPluginRegistrar) {
    
     SwiftJuBiterPlugin(with: registrar)
        

//            center.addObserver(self, selector: #selector(serviceStateObserver(_:)), name: N.DeviceManager.serviceChanged, object: nil)
   }
    
    @objc func deviceArrivalObserver(_ notification: Notification) {
        let device =  notification.userInfo?["Device"] as? BluetoothDevice

        guard let arrivalDevice = device else {
            return
        }
        
        devices[arrivalDevice.remoteID] = arrivalDevice
        
        let advertisementData = AdvertisementData.init()
        var scanResult = ScanResult.init()
        scanResult.advertisementData = advertisementData
        scanResult.device = arrivalDevice
        do {
            let data = try scanResult.serializedData()
            if(self.eventSink != nil){
                    DispatchQueue.main.async {
                        self.eventSink!(data)
                      }
                    
                }else {
                }
        } catch {
            print("catch error")
        }
    }
    
    
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
    switch call.method {
    case "getPlatformVersion":
        getPlatformVersion(call, result)
       break
    case "generateMnemonic":
        generateMnemonic(call, result)
       break
    case "checkMnemonic":
        checkMnemonic(call, result)

    case "generateSeed":
        generateSeed(call, result);
       break;
    case "seedToMasterPrivateKey":
        seedToMasterPrivateKey(call, result);
       break;
    case "getDeviceInfo":
        getDeviceInfo(call, result);
       break
    case "getDeviceCert":
        getDeviceCert(call, result);
       break
    case "sendApdu":
        sendApdu(call,result);
       break
    case "isInitialize":
        isInitialize(call,result);
       break
    case "isBootLoader":
        isBootLoader(call,result);
       break
    case "setTimeout":
        setTimeout(call,result);
       break
    case "enumApplets":
        enumApplets(call,result);
       break
    case "enumSupportCoins":
        enumSupportCoins(call,result);
       break
    case "getAppletVersion":
        getAppletVersion(call,result);
       break
    case "queryBattery":
        queryBattery(call,result);
       break
    case "clearContext":
        clearContext(call,result);
       break
    case "showVirtualPWD":
        showVirtualPWD(call,result);
       break
    case "cancelVirtualPWD":
        cancelVirtualPWD(call,result)
       break
    case "verifyPIN":
        verifyPIN(call,result)
       break

    //blue
    case "initDevice":
        initDevice(call, result)
        break
    case "startScan":
        startScan(call, result)
        break
    case "stopScan":
        stopScan(call, result)
        break
    case "connectDeviceAsync":
        connectDeviceAsync(call, result)
        break
    case "cancelConnect":
        cancelConnect(call,result)
        break
    case "disconnectDevice":
        disconnectDevice(call, result)
        break
    case "isConnected":
        isConnected(call, result)

    //btc
    case "BTCCreateContext_Software":
        BTCCreateContext_Software(call,result)
       break

    case "BTCCreateContext":
        BTCCreateContext(call,result);
       break

    case "BTCGetMainHDNode":
        BTCGetMainHDNode(call,result);
       break
    case "BTCGetHDNode":
        BTCGetHDNode(call,result);
       break
    case "BTCGetAddress":
        BTCGetAddress(call,result);
       break

    case "BTCSetAddress":
        BTCSetAddress(call,result);
       break

    case "BTCSetUint":
        BTCSetUint(call,result);
       break
    case "BTCSignTransaction":
        BTCSignTransaction(call,result);
       break
    case "BTCBuildUSDTOutput":
        BTCBuildUSDTOutput(call,result);

    //ETH

    case "ETHCreateContext_Software":
        ETHCreateContext_Software(call, result)
       break

    case "ETHCreateContext":
        ETHCreateContext(call,result);
       break

    case "ETHGetMainHDNode":
        ETHGetMainHDNode(call,result);
       break

    case "ETHGetHDNode":
        ETHGetHDNode(call,result);
       break

    case "ETHGetAddress":
        ETHGetAddress(call,result);
       break

    case "ETHSetAddress":
        ETHSetAddress(call,result);
       break

    case "ETHSignTransaction":
       ETHSignTransaction(call,result);
       break

    case "ETHBuildERC20Abi":
        ETHBuildERC20Abi(call,result);
       break

    default:
        break
    }
}

     func getPlatformVersion(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let iosVersion = UIDevice.current.systemVersion //iOS版本
         result(iosVersion)

     }
    
     func generateMnemonic(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let strength = JUB_Proto_Common_ENUM_MNEMONIC_STRENGTH(rawValue: call.arguments as! Int)
        
         do{
             let resultString =  try JuBiterCommon().generateMnemonic(pbStrength: strength!)
             let protobufSerialized = try resultString.serializedData()
             result(protobufSerialized)
         }catch{
            
         }
     }
    
     func checkMnemonic(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let mnemonic = call.arguments as! String
         let ret = JuBiterCommon().checkMnemonic(mnemonic: mnemonic)
         result(ret)
     }
    
     func generateSeed(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let args: NSDictionary = call.arguments as! NSDictionary
 
         let mnemoinic = args["mnemonic"] as! String
         let passphrase = args["passphrase"] as! String
        
        let resultString = JuBiterCommon().generateSeed(mnemonic: mnemoinic, passphrase: passphrase)
          do{
                 let protobufSerialized = try resultString.serializedData()
                 result(protobufSerialized)
          }catch{
                   
          }
     }
    
     func seedToMasterPrivateKey(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let args: NSDictionary = call.arguments as! NSDictionary
         let curves = args["curves"] as! Int
        
         let seed = args["seed"] as! String
         let curve = JUB_Proto_Common_CURVES(rawValue: curves)
         do{
            
            let resultString = try JuBiterCommon().seedToMasterPrivateKey(seed: seed, seedLen: UInt(curves), pbCurve: curve!)
             let protobufSerialized = try resultString.serializedData()
             result(protobufSerialized)
         }catch{
                          
         }
     }
    
     func getDeviceInfo(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
        let deviceID = call.arguments as! UInt
        let resultAny = JuBiterWallet().getDeviceInfo(contextID: deviceID)
        
         do{
//            let decoded : JUB_Proto_Common_DeviceInfo = try JUB_Proto_Common_DeviceInfo(serializedData: resultAny.serializedData())
            
            let protobufSerialized = try resultAny.serializedData()
             result(protobufSerialized)
         }catch{
                                
         }
     }
    
     func getDeviceCert(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
        
         let deviceID = call.arguments as! UInt
        
         do{
            let resultString = try JuBiterWallet().getDeviceCert(contextID: deviceID)
             let protobufSerialized = try resultString.serializedData()
             result(protobufSerialized)
         }catch{
        
         }
     }
    
     func  sendApdu(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
//         let args: NSDictionary = call.arguments as! NSDictionary
//         let deviceID = args["deviceID"] as! UInt
//         let apdu = args["apdu"] as! String
//         let resultString = JuBiterWallet.sendApdu(deviceID, apdu)
//        JUB_SendOneApdu(<#T##deviceID: JUB_UINT16##JUB_UINT16#>, <#T##apdu: JUB_CHAR_PTR!##JUB_CHAR_PTR!#>, <#T##response: JUB_CHAR_PTR_PTR!##JUB_CHAR_PTR_PTR!#>)
         let resultString = JUB_Proto_Common_ResultString()
         do{
             let protobufSerialized = try resultString.serializedData()
             result(protobufSerialized)
         }catch{
               
         }
     }
    
     func isInitialize(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let deviceID = call.arguments as! UInt
         let resultBoolean = JuBiterWallet().isInitialize(contextID: deviceID)
         result(resultBoolean)
     }
    
     func isBootLoader(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
        let deviceID = call.arguments as! UInt
        let resultBoolean =  JuBiterWallet().isBootLoader(contextID: deviceID)
         result(resultBoolean)
     }
    
     func setTimeout(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let args: NSDictionary = call.arguments as! NSDictionary
         let contextID = args["contextID"] as! UInt
         let timeout = args["timeout"] as! UInt
        let ret = JuBiterWallet().setTimeout(contextID: contextID, timeout: timeout)
         result(ret)
     }
    
     func enumApplets(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let deviceID = call.arguments as! UInt
        
         do{
            let resultString = try JuBiterWallet().enumApplets(contextID: deviceID)
             let protobufSerialized = try resultString.serializedData()
             result(protobufSerialized)
         } catch {
               
         }
     }
    
     func enumSupportCoins(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let deviceID = call.arguments as! UInt
         do{
            let resultString = try  JuBiterWallet().enumSupportCoins(contextID: deviceID)

             let protobufSerialized = try resultString.serializedData()
             result(protobufSerialized)
         } catch {
                
         }
     }
    
     func getAppletVersion(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
//         let args: NSDictionary = call.arguments as! NSDictionary
//         let deviceID = args["deviceID"] as! Int
//         let appleID = args["appleID"] as! String
         let resultString = JUB_Proto_Common_ResultString()
//         let resultString =  JuBiterWallet.getAppletVersion(deviceID, appletID)
         do{
             let protobufSerialized = try resultString.serializedData()
             result(protobufSerialized)
         } catch {
                
         }
     }
    
     func queryBattery(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let deviceID = call.arguments as! UInt
        let resultInt = JuBiterWallet().queryBattery(contextID: deviceID)

         do{
             let protobufSerialized = try resultInt.serializedData()
             result(protobufSerialized)
         } catch {
                
         }
     }
    
     func clearContext(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let deviceID = call.arguments as! UInt
        let ret = JuBiterWallet().clearContext(contextID: deviceID)
         result(ret)
     }
    
     func showVirtualPWD(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let contextID = call.arguments as! UInt
        let ret = JuBiterWallet().showVirtualPwd(contextID: contextID)
         result(ret)
     }
    
     func cancelVirtualPWD(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let contextID = call.arguments as! UInt
         let ret = JuBiterWallet().cancelVirtualPwd(contextID: contextID)
         result(ret)
     }
    
     func verifyPIN(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let args: NSDictionary = call.arguments as! NSDictionary
         let contextID = args["contextID"] as! UInt
         let PIN = args["PIN"] as! String
        let resultInt = JuBiterWallet().verifyPIN(contextID: contextID, pinMin: PIN)
         do{
             let protobufSerialized = try resultInt.serializedData()
            
             result(protobufSerialized)
         } catch {
                
         }
     }
    
  
    
     //************************************ 蓝牙接口 **************************************
    func initDevice(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
        print("initDevice")
           if(self.available){
        
                let scanCallback: DEV_ScanCallBack = { (name, uuid, type) -> Void in
                    var device =    BluetoothDevice.init()
                    device.name =  String(cString: name!)
                    device.remoteID =  String(cString: uuid!)
                    device.type = BluetoothDevice.TypeEnum.init(rawValue: Int(type))!
   
                    DispatchQueue.main.async {
                    NotificationCenter.default.post(
                        name: Notif.arrival,
                        object: nil,
                        userInfo: ["Device": device]
                    )
                    }
                }

                let discCallback: DEV_DiscCallBack = { (uuid) -> Void in
        //            #if DEBUG
        //            print(Date(), "disconnecting ", String(cString: uuid!))
        //            #endif
        //            DispatchQueue.main.async {
        //                NotificationCenter.default.post(
        //                    name: N.Device.disconnect,
        //                    object: nil,
        //                    userInfo: [N.Key.uuid: String(cString: uuid!)]
        //                )
        //            }
                }

                let param = DEVICE_INIT_PARAM(param: nil, callBack: nil,
                                              scanCallBack: scanCallback,
                                              discCallBack: discCallback )

                let rv = JUB_initDevice(param)
                guard rv == JUBR_OK else {
                    return
//                    throw JUB.JUBError.code(rv)
                }
            print("初始化 initDevice------")
            print(rv)
            
             result(0)
        
//            let rv2 = JUB_enumDevices()
//            print(rv2)
        
     
          
        } else {
            print("蓝牙不可用")
            pendingCall = call
            pendingResult = result
        }
    }
    
    func startScan(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){

        let ret = JUB_enumDevices()
        result(ret)
    }
    
    func stopScan(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {

        let ret = JUB_stopEnumDevices()
        result(ret)
    }
    
    func connectDeviceAsync(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
//        ConnectRequest
        
        let argss = call.arguments as! FlutterStandardTypedData
        do {
            let decoded : ConnectRequest = try ConnectRequest(serializedData: argss.data)
            
            print(decoded)
            
//            - remoteID : "6624126B-582E-2D6C-36DB-B1B6855FC1EC"
//            - name : "JuBiter-sigt"
//            - type : jubiter_plugin.BluetoothDevice.TypeEnum.classic
            
//            BluetoothDevice
            
            let remoteID = "6624126B-582E-2D6C-36DB-B1B6855FC1EC"
            let timeout = decoded.timeout
            let names = "JuBiter-sigt"
//             let device = devices[remoteID]
//             guard let connectDevice = device else {
//                 return
//             }
             
             var handle: JUB_UINT16 = 0
             let name: UnsafeMutablePointer<UInt8> = names
                     .utf8CString
                     .withUnsafeBytes {
                         let pointer = $0.baseAddress!.bindMemory(to: UInt8.self, capacity: $0.count+1)
                         return UnsafeMutablePointer(mutating: pointer)
             }
   
              
            let rv = JUB_connectDevice((JUB_BYTE_PTR)(name),  JUB_UINT32(1), &handle, JUB_UINT32(30000))
            
            
            var response = DeviceStateResponse.init()
            response.remoteID = remoteID
            response.deviceID = Int32(handle)
            response.state = DeviceStateResponse.BluetoothDeviceState.connected
            let data = try response.serializedData()
            methodChannel?.invokeMethod("DeviceState", arguments: data)
            print("链接结果")
            print(rv)
            print(handle)

        }
        catch {
            
        }
        
 

//            guard let rv == JUBR_OK else {
//                return
////                throw JUB.JUBError.code(rv)
//            }
//            self.handle = handle

    }
    
    func cancelConnect(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){

        let address = call.arguments as! String
        
        let name: UnsafeMutablePointer<UInt8> = address
                       .utf8CString
                       .withUnsafeBytes {
                           let pointer = $0.baseAddress!.bindMemory(to: UInt8.self, capacity: $0.count+1)
                           return UnsafeMutablePointer(mutating: pointer)
               }
        
        let ret = JUB_cancelConnect(name)
        result(ret)
    }
    
    func disconnectDevice(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
        let deviceID = call.arguments as! UInt
        let ret = JUB_disconnectDevice(JUB_UINT16(deviceID))
        result(ret)
    }
    
    func isConnected(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
        let deviceID = call.arguments as! UInt
        let state = JUB_disconnectDevice(JUB_UINT16(deviceID))
        result(state)
    }
    
     //************************************ BTC接口 **************************************
    
     func BTCCreateContext_Software(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let config = args["config"] as! FlutterStandardTypedData
             let xPrikey = args["xPrikey"] as! String
            let contextCfgBTC = try JUB_Proto_Bitcoin_ContextCfgBTC(serializedData: config.data)
 //            let resultInt = JuBiterBitcoin.createContext_Software(contextCfgBTC, xPrikey);
             let resultInt =  JUB_Proto_Common_ResultInt()
             result(try resultInt.serializedData())
         }catch{
            
         }
     }
    
     func BTCCreateContext(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let config = args["config"] as! FlutterStandardTypedData
             let deviceID = args["deviceID"] as! Int
            let contextCfgBTC = try JUB_Proto_Bitcoin_ContextCfgBTC(serializedData: config.data)
//            JuBiterBitcoin.createContext_Software(contextCfgBTC, xPrikey);
             let resultInt =  JUB_Proto_Common_ResultInt()
             result(try resultInt.serializedData())
         }catch{
            
         }

     }
    
     func BTCGetMainHDNode(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         let contexID = call.arguments as! Int
 //        let resultString = JuBiterBitcoin.getMainHDNode(contextID)
         let resultString = JUB_Proto_Common_ResultString()
         do{
             result(try resultString.serializedData())
         }catch{
            
         }
     }
    
     func BTCGetHDNode(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let config = args["contextID"] as! Int
             let path = args["bip32Path"] as! FlutterStandardTypedData
            let bip32Path = try JUB_Proto_Common_Bip32Path(serializedData: path.data)
             let resultString = JUB_Proto_Common_ResultString()
 //            let resultString  = JuBiterBitcoin.getHDNode(contextID, bip32Path);
             result(try resultString.serializedData())
            
         }catch{
            
         }
     }
    
     func BTCGetAddress(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let config = args["contextID"] as! Int
             let path = args["bip32Path"] as! FlutterStandardTypedData
             let isShow = args["isShow"] as! Bool
            let bip32Path = try JUB_Proto_Common_Bip32Path(serializedData: path.data)
            
             let resultString = JUB_Proto_Common_ResultString()
 //            let resultString = JuBiterBitcoin.getAddress(contextID, bip32Path, isShow)
             result(try resultString.serializedData())
         }catch{
            
         }
        
     }
    
     func BTCSetAddress(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let config = args["contextID"] as! Int
             let path = args["bip32Path"] as! FlutterStandardTypedData
            let bip32Path = try JUB_Proto_Common_Bip32Path(serializedData: path.data)
             let resultString = JUB_Proto_Common_ResultString()
     //      let resultString = JuBiterBitcoin.setAddress(contextID, bip32Path)
             result(try resultString.serializedData())
         }catch{
            
         }
     }
    
     func BTCSignTransaction(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let config = args["contextID"] as! Int
             let txInfo = args["txInfo"] as! FlutterStandardTypedData
            let transactionBTC = try JUB_Proto_Bitcoin_TransactionBTC(serializedData: txInfo.data)
             let resultString = JUB_Proto_Common_ResultString()
 //            let resultString = JuBiterBitcoin.signTransaction(contextID, transactionBTC)
             result(try resultString.serializedData())
         }catch{
            
         }
     }
    
     func BTCSetUint(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let contextID = args["contextID"] as! Int
             let uint = args["uintType"] as! FlutterStandardTypedData
 //            let unitType = try JUB_Proto_Bitcoin_BTC_UNIT_TYPE(rawValue: uint)
             let ret = 1
             result(ret)
 //            let ret = JuBiterBitcoin.setUint(contextID, uintType)
         }catch{
            
         }
     }
    
     func BTCBuildUSDTOutput(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
          do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let contextID = args["contextID"] as! Int
             let usdtTo = args["usdtTo"] as! String
             let amount = args["amount"] as! Int64
 //            let resultAny = JuBiterBitcoin.buildUSDTOutput(contextID, usdtTo, amount);
             let resultAny = JUB_Proto_Common_ResultAny()
             result(try resultAny.serializedData())
         }catch{
            
         }
     }
    
    
     //************************************ ETH接口 **************************************
    
     func ETHCreateContext_Software(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
           do{
            
             let args: NSDictionary = call.arguments as! NSDictionary
             let config = args["config"] as! FlutterStandardTypedData
             let xPrikey = args["xPrikey"] as! String
            
        
            let contextCfgETH = try JUB_Proto_Ethereum_ContextCfgETH(serializedData: config.data)
            let resultInt: JUB_Proto_Common_ResultInt = JuBiterEthereum().createContext_Software(pbCfg: contextCfgETH, masterPriInXPRV: xPrikey)
            
            result(try resultInt.serializedData())
         }catch{
            
         }
     }
    
     func ETHCreateContext(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let config = args["config"] as! FlutterStandardTypedData
             let deviceID = args["deviceID"] as! Int
             let contextCfgETH = try JUB_Proto_Ethereum_ContextCfgETH(serializedData: config.data)
             let resultInt = JuBiterEthereum().createContext(pbCfg: contextCfgETH, deviceID: UInt(deviceID))
             result(try resultInt.serializedData())
         }catch{
            
         }
     }
    
     func ETHGetMainHDNode(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
            do{
                 let args: NSDictionary = call.arguments as! NSDictionary
                 let contextID = args["contextID"] as! UInt
                 let format = args["format"] as! Int
                
                 let resultString: JUB_Proto_Common_ResultString = try JuBiterEthereum().getMainHDNodeETH(contextID: contextID, bpFormat: JUB_Proto_Ethereum_ENUM_PUB_FORMAT(rawValue: format)!)
                 result(try resultString.serializedData())
                
             }catch{
                
             }
     }
    
     func ETHGetHDNode(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let contextID = args["contextID"] as! UInt
             let format = args["format"] as! Int
             let path = args["bip32Path"] as! FlutterStandardTypedData
             let bip32Path: JUB_Proto_Common_Bip32Path = try JUB_Proto_Common_Bip32Path(serializedData: path.data)
             let resultString : JUB_Proto_Common_ResultString = try JuBiterEthereum().getHDNodeETH(contextID: contextID, bpFormat: JUB_Proto_Ethereum_ENUM_PUB_FORMAT(rawValue: format)!, pbPath: bip32Path)
            
             result(try resultString.serializedData())
         }catch{
            
         }
     }
    
     func ETHGetAddress(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let contextID = args["contextID"] as! UInt
             let isShow = args["isShow"] as! Bool
             let path = args["bip32Path"] as! FlutterStandardTypedData
             let bip32Path: JUB_Proto_Common_Bip32Path = try JUB_Proto_Common_Bip32Path(serializedData: path.data)
             let resultString : JUB_Proto_Common_ResultString = try JuBiterEthereum().getAddressETH(contextID: contextID, pbPath: bip32Path, bShow: isShow)

             result(try resultString.serializedData())
         }catch{
            
         }
     }
    
     func ETHSetAddress(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let contextID = args["contextID"] as! UInt
             let path = args["bip32Path"] as! FlutterStandardTypedData
             let bip32Path: JUB_Proto_Common_Bip32Path = try JUB_Proto_Common_Bip32Path(serializedData: path.data)

             let resultString : JUB_Proto_Common_ResultString = try JuBiterEthereum().setMyAddressETH(contextID: contextID, pbPath: bip32Path)
             result(try resultString.serializedData())
         }catch{
            
         }
     }
    
     func ETHSignTransaction(_ call: FlutterMethodCall, _ result: @escaping FlutterResult){
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let contextID = args["contextID"] as! UInt
             let txInfo = args["txInfo"] as! FlutterStandardTypedData
             let transactionETH: JUB_Proto_Ethereum_TransactionETH = try JUB_Proto_Ethereum_TransactionETH(serializedData: txInfo.data)

             let resultString : JUB_Proto_Common_ResultString = try JuBiterEthereum().signTransactionETH(contextID: contextID, pbPath: JUB_Proto_Common_Bip32Path(), nonce: transactionETH.nonce, gasLimit: transactionETH.gasLimit, gasPriceInWei: transactionETH.gasPriceInWei, to: transactionETH.to, valueInWei: transactionETH.valueInWei, input: transactionETH.input)
             result(try resultString.serializedData())
         }catch{
            
         }
     }
    
     func ETHBuildERC20Abi(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
         do{
             let args: NSDictionary = call.arguments as! NSDictionary
             let contextID = args["contextID"] as! UInt
             let address = args["address"] as! String
             let amountInWei = args["amountInWei"] as! String
            
             let resultString = JUB_Proto_Common_ResultString()
 //            let resultString =  JuBiterEthereum.buildERC20Abi(contextID, address, amountInWei);
//            let resultString : JUB_Proto_Common_ResultString() = JuBiterEthereum().buildERC20AbiETH(contextID: <#T##UInt#>, tokenName: <#T##String#>, unitDP: <#T##UInt16#>, contractAddress: <#T##String#>, tokenTo: <#T##String#>, tokenValue: <#T##String#>)
             result(try resultString.serializedData())
         }catch{
            
         }
     }
}

extension SwiftJuBiterPlugin: CBCentralManagerDelegate{

    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print(central.state)
        switch central.state {
        case .poweredOn:
               print("蓝牙状态 on" )
               if(pendingCall != nil && pendingResult != nil){
                initDevice(pendingCall!, pendingResult!)

               } else {
                print("pendingCall为空")
               }

            break
              default:
                print("蓝牙状态 defult" )
            break
              }
    }
}

extension SwiftJuBiterPlugin: FlutterStreamHandler{
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        print("onListen")
        self.eventSink = events
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        print("onCancel")
        self.eventSink = nil
        return nil
    }
}
