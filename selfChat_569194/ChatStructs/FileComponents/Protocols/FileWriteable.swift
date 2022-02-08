//
// Created by Note on 08.02.22.
//

import Foundation

public protocol FileWritable {
    func write(to fileURLComponents: FileURLComponents) throws -> URL
}