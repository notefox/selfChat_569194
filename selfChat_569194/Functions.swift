//
// Created by Note on 01.02.22.
//

import Foundation
import SwiftUI

private let maxColorValue: UInt32 = 16777215

func getColorByHex(rgbHexValue:UInt32, alpha:Double = 1.0) -> UIColor {
    let red = Double((rgbHexValue & 0xFF0000) >> 16) / 256.0
    let green = Double((rgbHexValue & 0xFF00) >> 8) / 256.0
    let blue = Double((rgbHexValue & 0xFF)) / 256.0

    return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
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