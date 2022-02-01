//
// Created by Note on 01.02.22.
//

import Foundation
import SwiftUI

public struct User: Codable, Hashable, Comparable {

    var uuid: UUID
    var name: String
    var rgbHexValue: UInt32

    public init(uuid: UUID, name: String, rgbHexValue: UInt32) {
        self.uuid = uuid
        self.name = name
        self.rgbHexValue = rgbHexValue
    }

    public init(uuid: UUID, name: String) {
        self.uuid = uuid
        self.name = name
        rgbHexValue = getRandomColorValue()
    }

    public init(name: String) {
        uuid = generateNewUUID()
        rgbHexValue = getRandomColorValue()
        self.name = name
    }

    public mutating func changeColor(newColor: UInt32) throws {
        guard validateColor(newColor) else {
            throw ColorErrors.InvalidValue(invalidValue: newColor)
        }

        rgbHexValue = newColor
    }
    
    public var description: String {
        "User(uuid: \(uuid), name: \(name), rgbHexValue: \(rgbHexValue))"
    }

    public var initials: String {
        var buildString = ""
        for splitted in name.split(separator: " ") {
            let first = splitted.first
            if first != nil {
                buildString.append(first.unsafelyUnwrapped.uppercased())
            }
        }
        return buildString
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(name)
        hasher.combine(rgbHexValue)
    }

    public static func ==(lhs: User, rhs: User) -> Bool {
        if lhs.uuid != rhs.uuid {
            return false
        }
        if lhs.name != rhs.name {
            return false
        }
        if lhs.rgbHexValue != rhs.rgbHexValue {
            return false
        }
        return true
    }

    public static func <(lhs: User, rhs: User) -> Bool {
        fatalError("< has not been implemented")
    }
}
