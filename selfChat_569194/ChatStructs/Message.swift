//
// Created by Note on 01.02.22.
//

import Foundation

struct Message: Codable, Hashable, Comparable {

    let uuid: UUID

    let user: User?

    var message: String

    let timestamp: UInt64

    public init(user: User, message: String) {
        uuid = generateNewUUID()
        self.user = user
        self.message = message
        timestamp = currentTimeMillis()
    }

    public init(message: String) {
        uuid = generateNewUUID()
        user = nil;
        self.message = message
        timestamp = currentTimeMillis()
    }

    public mutating func updateMessage(_ message: String) {
        self.message = message
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(message)
    }

    static func ==(lhs: Message, rhs: Message) -> Bool {
        if lhs.uuid != rhs.uuid {
            return false
        }
        if lhs.message != rhs.message {
            return false
        }
        return true
    }

    static func <(lhs: Message, rhs: Message) -> Bool {
        lhs.timestamp < rhs.timestamp
    }
}
