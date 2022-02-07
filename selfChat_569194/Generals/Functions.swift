//
// Created by Note on 01.02.22.
//

import Foundation
import SwiftUI

private let maxColorValue: UInt32 = 16777215

private let documentUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

private let externalUserMessageColor: Color = Color.gray
private let localUserMessageColor: Color = Color.blue

private let localUserMessageAlignment: Alignment = .leading
private let externalUserMessageAlignment: Alignment = .trailing

func getColorByHex(_ rgbHexValue:UInt32) -> Color {
    let red = Double((rgbHexValue & 0xFF0000) >> 16) / 256.0
    let green = Double((rgbHexValue & 0xFF00) >> 8) / 256.0
    let blue = Double((rgbHexValue & 0xFF)) / 256.0

    return Color(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
}

public func getRepresentativeMessageColorOfMessage(_ message: Message) -> Color {
    if message.user == nil {
        return localUserMessageColor
    } else {
        return externalUserMessageColor
    }
}

public func getRepresentativeMessageAlignment(_ message: Message) -> Alignment {
    if message.user == nil {
        return localUserMessageAlignment
    } else {
        return externalUserMessageAlignment
    }
}

public func getRandomColorValue() -> UInt32 {
    arc4random_uniform(maxColorValue)
}

public func generateNewUUID() -> UUID {
    let generatedUUID: UUID? = UUID(uuidString: NSUUID().uuidString) ?? nil

    guard generatedUUID != nil else {
        return UUID(uuidString: "0").unsafelyUnwrapped
    }
    return generatedUUID.unsafelyUnwrapped
}

public func validateColor(_ color: UInt32) -> Bool {
    color < maxColorValue && color >= 0
}

public func currentTimeMillis() -> UInt64 {
    let nowDouble = NSDate().timeIntervalSince1970
    return UInt64(nowDouble*1000)
}

public func getTimestamp() -> String {
    String(NSDate().timeIntervalSince1970)
}

public func saveStringToFile(chatData: String, name: String) throws {
    let pathWithFilename = documentUrl.appendingPathComponent(name+".json")
    try chatData.write(to: pathWithFilename,
            atomically: true,
            encoding: .utf8)
    
}

public func showAllAvailableFiles(fileExtension: String) throws -> [URL] {
    let directoryContents = try FileManager.default.contentsOfDirectory(at: documentUrl, includingPropertiesForKeys: nil)
    return directoryContents.filter{ $0.pathExtension == fileExtension }
}


