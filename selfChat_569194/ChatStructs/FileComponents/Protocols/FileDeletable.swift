//
// Created by Note on 08.02.22.
//

import Foundation

public protocol FileDeletable {
    static func delete(_ fileURLComponents: FileURLComponents) throws -> Bool
}