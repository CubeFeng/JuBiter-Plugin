// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: jubiterblue.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// Wrapper message for `int32`.
///
/// Allows for nullability of fields in messages
struct Int32Value {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The int32 value.
  var value: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct BluetoothState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var state: BluetoothState.State = .unknown

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum State: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case unknown // = 0
    case unavailable // = 1
    case unauthorized // = 2
    case turningOn // = 3
    case on // = 4
    case turningOff // = 5
    case off // = 6
    case UNRECOGNIZED(Int)

    init() {
      self = .unknown
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .unknown
      case 1: self = .unavailable
      case 2: self = .unauthorized
      case 3: self = .turningOn
      case 4: self = .on
      case 5: self = .turningOff
      case 6: self = .off
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .unknown: return 0
      case .unavailable: return 1
      case .unauthorized: return 2
      case .turningOn: return 3
      case .on: return 4
      case .turningOff: return 5
      case .off: return 6
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension BluetoothState.State: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [BluetoothState.State] = [
    .unknown,
    .unavailable,
    .unauthorized,
    .turningOn,
    .on,
    .turningOff,
    .off,
  ]
}

#endif  // swift(>=4.2)

struct AdvertisementData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var localName: String {
    get {return _storage._localName}
    set {_uniqueStorage()._localName = newValue}
  }

  var txPowerLevel: Int32Value {
    get {return _storage._txPowerLevel ?? Int32Value()}
    set {_uniqueStorage()._txPowerLevel = newValue}
  }
  /// Returns true if `txPowerLevel` has been explicitly set.
  var hasTxPowerLevel: Bool {return _storage._txPowerLevel != nil}
  /// Clears the value of `txPowerLevel`. Subsequent reads from it will return its default value.
  mutating func clearTxPowerLevel() {_uniqueStorage()._txPowerLevel = nil}

  var connectable: Bool {
    get {return _storage._connectable}
    set {_uniqueStorage()._connectable = newValue}
  }

  /// Map of manufacturers to their data
  var manufacturerData: Dictionary<Int32,Data> {
    get {return _storage._manufacturerData}
    set {_uniqueStorage()._manufacturerData = newValue}
  }

  /// Map of service UUIDs to their data.
  var serviceData: Dictionary<String,Data> {
    get {return _storage._serviceData}
    set {_uniqueStorage()._serviceData = newValue}
  }

  var serviceUuids: [String] {
    get {return _storage._serviceUuids}
    set {_uniqueStorage()._serviceUuids = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct ScanSettings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var androidScanMode: Int32 = 0

  var serviceUuids: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct ScanResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The received peer's ID.
  var device: BluetoothDevice {
    get {return _storage._device ?? BluetoothDevice()}
    set {_uniqueStorage()._device = newValue}
  }
  /// Returns true if `device` has been explicitly set.
  var hasDevice: Bool {return _storage._device != nil}
  /// Clears the value of `device`. Subsequent reads from it will return its default value.
  mutating func clearDevice() {_uniqueStorage()._device = nil}

  /// unused
  var advertisementData: AdvertisementData {
    get {return _storage._advertisementData ?? AdvertisementData()}
    set {_uniqueStorage()._advertisementData = newValue}
  }
  /// Returns true if `advertisementData` has been explicitly set.
  var hasAdvertisementData: Bool {return _storage._advertisementData != nil}
  /// Clears the value of `advertisementData`. Subsequent reads from it will return its default value.
  mutating func clearAdvertisementData() {_uniqueStorage()._advertisementData = nil}

  /// unused
  var rssi: Int32 {
    get {return _storage._rssi}
    set {_uniqueStorage()._rssi = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct ConnectRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// mac or uuid
  var remoteID: String = String()

  var timeout: Int32 = 0

  /// unused
  var androidAutoConnect: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct BluetoothDevice {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// mac or uuid
  var remoteID: String = String()

  var name: String = String()

  var type: BluetoothDevice.TypeEnum = .unknown

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum TypeEnum: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case unknown // = 0
    case classic // = 1
    case le // = 2
    case dual // = 3
    case UNRECOGNIZED(Int)

    init() {
      self = .unknown
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .unknown
      case 1: self = .classic
      case 2: self = .le
      case 3: self = .dual
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .unknown: return 0
      case .classic: return 1
      case .le: return 2
      case .dual: return 3
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension BluetoothDevice.TypeEnum: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [BluetoothDevice.TypeEnum] = [
    .unknown,
    .classic,
    .le,
    .dual,
  ]
}

#endif  // swift(>=4.2)

struct DeviceStateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var remoteID: String = String()

  var state: DeviceStateResponse.BluetoothDeviceState = .disconnected

  var deviceID: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum BluetoothDeviceState: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case disconnected // = 0
    case connecting // = 1
    case connected // = 2
    case disconnecting // = 3
    case UNRECOGNIZED(Int)

    init() {
      self = .disconnected
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .disconnected
      case 1: self = .connecting
      case 2: self = .connected
      case 3: self = .disconnecting
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .disconnected: return 0
      case .connecting: return 1
      case .connected: return 2
      case .disconnecting: return 3
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension DeviceStateResponse.BluetoothDeviceState: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [DeviceStateResponse.BluetoothDeviceState] = [
    .disconnected,
    .connecting,
    .connected,
    .disconnecting,
  ]
}

#endif  // swift(>=4.2)

struct ConnectedDevicesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var devices: [BluetoothDevice] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Int32Value: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Int32Value"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.value)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.value != 0 {
      try visitor.visitSingularInt32Field(value: self.value, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Int32Value, rhs: Int32Value) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension BluetoothState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "BluetoothState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "state"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.state)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.state != .unknown {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: BluetoothState, rhs: BluetoothState) -> Bool {
    if lhs.state != rhs.state {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension BluetoothState.State: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNKNOWN"),
    1: .same(proto: "UNAVAILABLE"),
    2: .same(proto: "UNAUTHORIZED"),
    3: .same(proto: "TURNING_ON"),
    4: .same(proto: "ON"),
    5: .same(proto: "TURNING_OFF"),
    6: .same(proto: "OFF"),
  ]
}

extension AdvertisementData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "AdvertisementData"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "local_name"),
    2: .standard(proto: "tx_power_level"),
    3: .same(proto: "connectable"),
    4: .standard(proto: "manufacturer_data"),
    5: .standard(proto: "service_data"),
    6: .standard(proto: "service_uuids"),
  ]

  fileprivate class _StorageClass {
    var _localName: String = String()
    var _txPowerLevel: Int32Value? = nil
    var _connectable: Bool = false
    var _manufacturerData: Dictionary<Int32,Data> = [:]
    var _serviceData: Dictionary<String,Data> = [:]
    var _serviceUuids: [String] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _localName = source._localName
      _txPowerLevel = source._txPowerLevel
      _connectable = source._connectable
      _manufacturerData = source._manufacturerData
      _serviceData = source._serviceData
      _serviceUuids = source._serviceUuids
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._localName)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._txPowerLevel)
        case 3: try decoder.decodeSingularBoolField(value: &_storage._connectable)
        case 4: try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufInt32,SwiftProtobuf.ProtobufBytes>.self, value: &_storage._manufacturerData)
        case 5: try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufBytes>.self, value: &_storage._serviceData)
        case 6: try decoder.decodeRepeatedStringField(value: &_storage._serviceUuids)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._localName.isEmpty {
        try visitor.visitSingularStringField(value: _storage._localName, fieldNumber: 1)
      }
      if let v = _storage._txPowerLevel {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if _storage._connectable != false {
        try visitor.visitSingularBoolField(value: _storage._connectable, fieldNumber: 3)
      }
      if !_storage._manufacturerData.isEmpty {
        try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufInt32,SwiftProtobuf.ProtobufBytes>.self, value: _storage._manufacturerData, fieldNumber: 4)
      }
      if !_storage._serviceData.isEmpty {
        try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufBytes>.self, value: _storage._serviceData, fieldNumber: 5)
      }
      if !_storage._serviceUuids.isEmpty {
        try visitor.visitRepeatedStringField(value: _storage._serviceUuids, fieldNumber: 6)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: AdvertisementData, rhs: AdvertisementData) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._localName != rhs_storage._localName {return false}
        if _storage._txPowerLevel != rhs_storage._txPowerLevel {return false}
        if _storage._connectable != rhs_storage._connectable {return false}
        if _storage._manufacturerData != rhs_storage._manufacturerData {return false}
        if _storage._serviceData != rhs_storage._serviceData {return false}
        if _storage._serviceUuids != rhs_storage._serviceUuids {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ScanSettings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ScanSettings"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "android_scan_mode"),
    2: .standard(proto: "service_uuids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.androidScanMode)
      case 2: try decoder.decodeRepeatedStringField(value: &self.serviceUuids)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.androidScanMode != 0 {
      try visitor.visitSingularInt32Field(value: self.androidScanMode, fieldNumber: 1)
    }
    if !self.serviceUuids.isEmpty {
      try visitor.visitRepeatedStringField(value: self.serviceUuids, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ScanSettings, rhs: ScanSettings) -> Bool {
    if lhs.androidScanMode != rhs.androidScanMode {return false}
    if lhs.serviceUuids != rhs.serviceUuids {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ScanResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ScanResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "device"),
    2: .standard(proto: "advertisement_data"),
    3: .same(proto: "rssi"),
  ]

  fileprivate class _StorageClass {
    var _device: BluetoothDevice? = nil
    var _advertisementData: AdvertisementData? = nil
    var _rssi: Int32 = 0

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _device = source._device
      _advertisementData = source._advertisementData
      _rssi = source._rssi
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._device)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._advertisementData)
        case 3: try decoder.decodeSingularInt32Field(value: &_storage._rssi)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._device {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._advertisementData {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if _storage._rssi != 0 {
        try visitor.visitSingularInt32Field(value: _storage._rssi, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ScanResult, rhs: ScanResult) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._device != rhs_storage._device {return false}
        if _storage._advertisementData != rhs_storage._advertisementData {return false}
        if _storage._rssi != rhs_storage._rssi {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension ConnectRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ConnectRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "remote_id"),
    2: .same(proto: "timeout"),
    3: .standard(proto: "android_auto_connect"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.remoteID)
      case 2: try decoder.decodeSingularInt32Field(value: &self.timeout)
      case 3: try decoder.decodeSingularBoolField(value: &self.androidAutoConnect)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.remoteID.isEmpty {
      try visitor.visitSingularStringField(value: self.remoteID, fieldNumber: 1)
    }
    if self.timeout != 0 {
      try visitor.visitSingularInt32Field(value: self.timeout, fieldNumber: 2)
    }
    if self.androidAutoConnect != false {
      try visitor.visitSingularBoolField(value: self.androidAutoConnect, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ConnectRequest, rhs: ConnectRequest) -> Bool {
    if lhs.remoteID != rhs.remoteID {return false}
    if lhs.timeout != rhs.timeout {return false}
    if lhs.androidAutoConnect != rhs.androidAutoConnect {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension BluetoothDevice: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "BluetoothDevice"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "remote_id"),
    2: .same(proto: "name"),
    3: .same(proto: "type"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.remoteID)
      case 2: try decoder.decodeSingularStringField(value: &self.name)
      case 3: try decoder.decodeSingularEnumField(value: &self.type)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.remoteID.isEmpty {
      try visitor.visitSingularStringField(value: self.remoteID, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if self.type != .unknown {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: BluetoothDevice, rhs: BluetoothDevice) -> Bool {
    if lhs.remoteID != rhs.remoteID {return false}
    if lhs.name != rhs.name {return false}
    if lhs.type != rhs.type {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension BluetoothDevice.TypeEnum: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNKNOWN"),
    1: .same(proto: "CLASSIC"),
    2: .same(proto: "LE"),
    3: .same(proto: "DUAL"),
  ]
}

extension DeviceStateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "DeviceStateResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "remote_id"),
    2: .same(proto: "state"),
    3: .same(proto: "deviceID"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.remoteID)
      case 2: try decoder.decodeSingularEnumField(value: &self.state)
      case 3: try decoder.decodeSingularInt32Field(value: &self.deviceID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.remoteID.isEmpty {
      try visitor.visitSingularStringField(value: self.remoteID, fieldNumber: 1)
    }
    if self.state != .disconnected {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 2)
    }
    if self.deviceID != 0 {
      try visitor.visitSingularInt32Field(value: self.deviceID, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: DeviceStateResponse, rhs: DeviceStateResponse) -> Bool {
    if lhs.remoteID != rhs.remoteID {return false}
    if lhs.state != rhs.state {return false}
    if lhs.deviceID != rhs.deviceID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension DeviceStateResponse.BluetoothDeviceState: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "DISCONNECTED"),
    1: .same(proto: "CONNECTING"),
    2: .same(proto: "CONNECTED"),
    3: .same(proto: "DISCONNECTING"),
  ]
}

extension ConnectedDevicesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "ConnectedDevicesResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "devices"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.devices)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.devices.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.devices, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: ConnectedDevicesResponse, rhs: ConnectedDevicesResponse) -> Bool {
    if lhs.devices != rhs.devices {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
