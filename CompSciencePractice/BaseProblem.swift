//
//  BaseProblem.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/24/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

enum FileReadError:Error {
    case noFile(String)
}

protocol BaseProblem {
    func exec()
}

extension BaseProblem {
    func readFileFromExecDirectory(_ fileName:String) throws -> String  {
        let path = "\(FileManager.default.currentDirectoryPath)/\(fileName)"
        guard let fileHandle = FileHandle(forReadingAtPath: path) else {
            throw FileReadError.noFile("No file at path: \(path)")
        }
        return String(data: fileHandle.readDataToEndOfFile(), encoding: .utf8)!
    }
}
