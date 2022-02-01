//
// Created by Note on 01.02.22.
//

import Foundation

public struct Chat: Codable, Hashable {

    var uuid: UUID

    var withUser: User

    private var messages: Set<Message> = Set()

    public init(_ withUser: User) {
        self.uuid = generateNewUUID()
        self.withUser = withUser
    }
    
    public init(_ uuid: UUID, _ withUser: User) {
        self.uuid = uuid
        self.withUser = withUser
    }

    public mutating func changeUser(_ newUser: User) {
        withUser = newUser
    }

    public mutating func addMessage(_ message: String, _ local: Bool) {
        if local {
            messages.insert(Message(message))
        } else {
            messages.insert(Message(withUser, message))
        }
    }
    
    
}
