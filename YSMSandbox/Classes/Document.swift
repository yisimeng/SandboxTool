//
//  Document.swift
//  YSMSandbox
//
//  Created by duanzengguang on 2020/4/4.
//

import UIKit

enum FileType {
    case directory
    case file
}

struct Document {
    // 文件名
    var fileName: String
    // 文件类型
    var type: FileType = .file
    // 文件路径
    private(set) var currentDirectoryPath: String
    // 全路径
    var fullPath: String {
        return currentDirectoryPath + "/" + fileName
    }
    
    init(path: String, file name: String) {
        currentDirectoryPath = path
        fileName = name
        isDirectory()
    }
}

extension Document {
    
    @discardableResult
    mutating func isDirectory() -> Bool {
        var directoryExists = ObjCBool.init(false)
        let succ = FileManager.default.fileExists(atPath: self.fullPath, isDirectory: &directoryExists)
        let result = succ && directoryExists.boolValue
        if result {
            self.type = .directory
        }
        return result
    }
    
}
