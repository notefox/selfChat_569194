//
// Created by Note on 08.02.22.
//

import Foundation

public protocol FileReadable {
    static func read<T: Decodable>(_ type: T.Type, from fileURLComponents: FileURLComponents) throws -> T
}