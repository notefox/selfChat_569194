//
//  FileURLComponents.swift
//  selfChat_569194
//
//  Created by Note on 08.02.22.
//

import Foundation

public struct FileURLComponents {
    var fileName: String
    var fileExtension: String?
    var directoryName: String?
    var directoryPath: FileManager.SearchPathDirectory
}
