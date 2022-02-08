//
//  FileUtils.swift
//  selfChat_569194
//
//  Created by Note on 08.02.22.
//

import Foundation

public typealias Fileable = FileWritable & FileReadable & FileDeletable

public class File: NSObject {
    
    public static func write(_ data: Data, to fileURLComponents: FileURLComponents) throws -> URL {
        do {
            let destinationURL = try File.fileURL(using: fileURLComponents)
            
            try data.write(to: destinationURL)
            return destinationURL
        } catch {
            throw error
        }
    }
    
    public static func read(from fileURLComponents: FileURLComponents) throws -> Data {
        do {
            let sourceURL = try File.fileURL(using: fileURLComponents)
            
            return try Data(contentsOf: sourceURL)
        } catch {
            throw error
        }
    }
    
    public static func delete(_ fileURLComponents: FileURLComponents) throws -> Bool {
        do {
            let sourceURL = try File.fileURL(using: fileURLComponents)
            
            guard try File.exists(fileURLComponents) else {
                return false
            }
                
            try FileManager.default.removeItem(at: sourceURL)
            return true

        } catch {
            throw error
        }
    }
    
    public static func exists(_ fileURLComponents: FileURLComponents) throws -> Bool {
        do {
            let sourceURL = try File.fileURL(using: fileURLComponents)
            
            if FileManager.default.fileExists(atPath: sourceURL.path) {
                return true
            } else {
                return false
            }
        } catch {
            throw error
        }
    }
    
    private static func fileURL(using fileURLComponents: FileURLComponents) throws -> URL {
        do {
            let dirURL = try File.directoryURL(for: fileURLComponents.directoryName, at: fileURLComponents.directoryPath)
            
            var fileURL: URL
            if let fileExtension = fileURLComponents.fileExtension {
                fileURL = URL(fileURLWithPath: fileURLComponents.fileName, relativeTo: dirURL).appendingPathExtension(fileExtension)
            } else {
                fileURL = URL(fileURLWithPath: fileURLComponents.fileName, relativeTo: dirURL)
            }
            return fileURL
        } catch {
            throw error
        }
    }

    private static func directoryURL(for directoryName: String?, at directoryPath: FileManager.SearchPathDirectory) throws -> URL {
        var destinationDirectoryURL = FileManager.default.urls(for: directoryPath, in: .userDomainMask)[0]
        
        if let directoryName = directoryName {
            destinationDirectoryURL = destinationDirectoryURL.appendingPathComponent(directoryName, isDirectory: true)
        }
        
        do {
            try FileManager.default.createDirectory(at: destinationDirectoryURL, withIntermediateDirectories: true, attributes: nil)
            return destinationDirectoryURL
        } catch {
            throw FileError.unableToCreateDirectory(directory: destinationDirectoryURL.absoluteString, reason: error.localizedDescription)
        }
    }
}
