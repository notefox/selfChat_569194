//
//  InstanceSaver.swift
//  selfChat_569194
//
//  Created by Note on 08.02.22.
//

import Foundation

public class InstanceSaver: NSObject {
    
    private var instanceSaveFile: FileURLComponents

    private var lastSaveUrl: URL? = nil

    override init() {
        instanceSaveFile = FileURLComponents(fileName: "selfChat_instance",
                fileExtension: "json",
                directoryName: "selfChat",
                directoryPath: .documentDirectory)
    }

    public func saveInstance(_ currentInstance: AppInstance) throws {
        if (try File.exists(instanceSaveFile)) {
            guard try File.delete(instanceSaveFile) else {
                return
            }
        }
        let data = try currentInstance.asJson()
        lastSaveUrl = try File.write(data, to: instanceSaveFile)
    }

    public func loadLastSaveToInstance(_ currentInstance: AppInstance) throws {
        let readData = try File.read(from: instanceSaveFile)
        try currentInstance.importData(readData)
    }
}
