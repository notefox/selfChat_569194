//
// Created by Note on 07.02.22.
//

import Foundation
import SwiftUI

public class AppInstance: ObservableObject {

    public static var instance: AppInstance = AppInstance()

    var instanceSaver: InstanceSaver = InstanceSaver()

    @Published private var chats = Dictionary<User, Chat>()
    
    private var testMode = true

    public func initialize() {
        do {
            try instanceSaver.loadLastSaveToInstance(.instance)
        } catch {
            fillWithTestValuesOnTestMode()
            try! instanceSaver.saveInstance(.instance)
        }
    }

    public func fillWithTestValuesOnTestMode() {      
        if(testMode) {
            try? Chat.emptySamples.forEach { chat in
                try addChat(chat)
            }
        }
    }
    
    public func allUsers() -> Set<User> {
        Set(chats.keys)
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

    func importData(_ data: Data) throws {
        chats = try decodeFromJsonData(jsonData: data)
        try! InstanceSaver().saveInstance(.instance)
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
        try! InstanceSaver().saveInstance(.instance)
    }

    private func userExistsAsKey(_ user: User) -> Bool {
        chats.keys.contains(user)
    }

    public func asJsonString() throws -> String? {
        let data: Data? = encodeToJsonData(chats: chats)
        let jsonString: String? = try dataToString(data)
        return jsonString
    }

    public func asJson() throws -> Data {
        encodeToJsonData(chats: chats) ?? Data()
    }

    private func dataToString(_ data: Data?) throws -> String? {
        String(decoding: data!, as: UTF8.self)
    }

    private func encodeToJsonData(chats: Dictionary<User, Chat>) -> Data? {
        let encoder: JSONEncoder = JSONEncoder()
        let data: Data? = try? encoder.encode(chats)
        return data
    }

    private func decodeFromJsonData(jsonData: Data) throws -> Dictionary<User, Chat> {
        let decoder: JSONDecoder = JSONDecoder()
        let recoveredChats = try decoder.decode(Dictionary<User, Chat>.self, from: jsonData)
        return recoveredChats
    }

    public func reset() {
        chats.removeAll()
        try! InstanceSaver().saveInstance(.instance)
    }
}
