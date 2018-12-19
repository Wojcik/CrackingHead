//
//  RemoveDuplicates.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/14/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class RemoveDuplicates: BaseProblem {
    func exec() {
        let str = Array("abcdefABCDEF".utf8).map { Int($0) - Int("A".utf16.first!)}
        print(str)
        var input = "1 1 2 3 4 4 4 5 6 6".toIntArray()
        removeDuplicates(&input)
        print(input)
    }
    
    func removeDuplicates(_ input:inout [Int]) {
        var idx = 1
        for i in 0..<input.count - 1 {
            if input[i] != input[i+1] {
                input[idx] = input[i + 1]
                idx += 1
            }
        }
        input.removeLast(input.count - idx)
    }
}
