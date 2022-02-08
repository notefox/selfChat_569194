//
// Created by Note on 08.02.22.
//

import Foundation

public enum FileError: Error {
    case unableToCreateDirectory(directory: String, reason: String)
}