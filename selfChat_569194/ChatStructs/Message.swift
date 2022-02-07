//
// Created by Note on 01.02.22.
//

import Foundation

public struct Message: Codable, Hashable, Comparable, Identifiable {

    public var id: UUID

    let user: User?

    var message: String

    let timestamp: UInt64

    public init(user: User, message: String) {
        id = generateNewUUID()
        self.user = user
        self.message = message
        timestamp = currentTimeMillis()
    }

    public init(_ message: String) {
        id = generateNewUUID()
        user = nil;
        self.message = message
        timestamp = currentTimeMillis()
    }

    public mutating func updateMessage(_ message: String) {
        self.message = message
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(message)
    }

    public static func ==(lhs: Message, rhs: Message) -> Bool {
        if lhs.id != rhs.id {
            return false
        }
        if lhs.message != rhs.message {
            return false
        }
        return true
    }

    public static func <(lhs: Message, rhs: Message) -> Bool {
        lhs.timestamp < rhs.timestamp
    }
}
