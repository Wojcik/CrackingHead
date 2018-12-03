//
//  Collection.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/22/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

extension Collection where Element:Equatable {
    func formUnigueIndex(after index:inout Index) {
        var prev = index
        repeat {
            prev = index
            formIndex(&index, offsetBy:1)
        } while index < endIndex && self[prev] == self[index]
    }
    
    func formUniqueIndex(before index:inout Index) {
        var prev = index
        repeat {
            prev = index
            formIndex(&index, offsetBy:-1)
        } while index > startIndex && self[prev] == self[index]
    }
}
