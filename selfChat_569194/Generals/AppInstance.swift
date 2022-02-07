//
// Created by Note on 07.02.22.
//

import Foundation
import SwiftUI

class AppInstance: ObservableObject {

    @Published private var chats = Dictionary<User, Chat>()

    private var testMode = true

    init() {
        fillWithTestValuesOnTestMode()
    }

    public func fillWithTestValuesOnTestMode() {
        reset()
        
        if(testMode) {
            try? Chat.emptySamples.forEach { chat in
                try addChat(chat)
            }
        }
    }
    
    public func allChats() -> Set<Chat> {
        Set(chats.values)
    }

    public func addChat(_ chat: Chat) throws {
        guard !userExistsAsKey(chat.withUser) else {
            throw ChatErrors.ChatWithUserAlreadyExists(chat: chat)
        }
        chats[chat.withUser] = chat
    }

    public func getChatWithUser(_ user: User) throws -> Chat {
        guard userExistsAsKey(user) else {
            throw ChatErrors.UserDoesntExistError(user: user)
        }
        return chats[user].unsafelyUnwrapped
    }

    public func updateChat(_ chat: Chat) throws {
        guard userExistsAsKey(chat.withUser) else {
            try addChat(chat)
            return
        }
        chats[chat.withUser] = chat
    }

    public func save() throws {
        let chatData: String = try asJson() ?? ""
        try saveStringToFile(chatData: chatData, name: getTimestamp())
    }

    private func userExistsAsKey(_ user: User) -> Bool {
        chats.keys.contains(user)
    }

    public func asJson() throws -> String? {
        let data: Data? = encodeToJsonData(chats: chats)
        let jsonString: String? = try dataToString(data)
        return jsonString
    }

    private func dataToString(_ data: Data?) throws -> String? {
        String(decoding: data!, as: UTF8.self)
    }

    private func encodeToJsonData(chats: Dictionary<User, Chat>) -> Data? {
        let encoder: JSONEncoder = JSONEncoder()
        let data: Data? = try? encoder.encode(chats)
        return data
    }

    public func reset() {
        chats.removeAll()
    }
}
