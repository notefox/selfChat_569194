//
// Created by Note on 01.02.22.
//

import Foundation

public struct Chat: Codable, Hashable, Identifiable {

    public var id: UUID

    var withUser: User

    private var messages: Dictionary<UInt64, Message> = Dictionary()

    public init(_ withUser: User) {
        id = generateNewUUID()
        self.withUser = withUser
    }
    
    public init(_ uuid: UUID, _ withUser: User) {
        self.id = uuid
        self.withUser = withUser
    }

    public mutating func changeUser(_ newUser: User) {
        withUser = newUser
    }

    public mutating func addMessage(_ message: String, _ local: Bool) {
        let messageToSave: Message
        if local {
            messageToSave = Message(message)
        } else {
            messageToSave = Message(user: withUser, message: message)
        }
        
        var currentTimestamp = messageToSave.timestamp
        
        while messages.keys.contains(currentTimestamp) {
            currentTimestamp += 1
        }
        
        messages[currentTimestamp] = messageToSave
    }
    
    public func allMessages() -> Set<Message> {
        Set(messages.values)
    }
}

extension Chat {
    static let emptySamples = [
        Chat(User(name: "test 1")),
        Chat(User(name: "test 2")),
        Chat(User(name: "test 3")),
        Chat(User(name: "test 4")),
        Chat(User(name: "test 5")),
        Chat(User(name: "test 6")),
        Chat(User(name: "test 7")),
        Chat(User(name: "test 8")),
        Chat(User(name: "test 9"))
    ]

    static func fullSample() -> Chat{
        var chat: Chat = Chat(User(name: "test"))
        chat.addMessage("test message 1", true)
        chat.addMessage("test message 2", false)
        chat.addMessage("test message 3", true)
        chat.addMessage("test message 4", false)
        chat.addMessage("test message 5", true)
        chat.addMessage("test message 6", false)
        chat.addMessage("test message 6", true)
        chat.addMessage("test message 7", false)
        chat.addMessage("test message 8", true)
        chat.addMessage("test message 9", false)
        return chat
    }
}
