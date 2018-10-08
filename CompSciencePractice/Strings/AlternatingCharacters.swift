//
//  AlternatingCharacters.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/2/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class AlternatingCharacters: BaseProblem {
    func exec() {
        let string = "AAABBB"
        print(alternatingCharacters(s: string))
    }
    
    func alternatingCharacters(s: String) -> Int {
        var deletionsCount = 0
        var previousChar:Character? = nil
        for character in s {
            if character == previousChar {
                deletionsCount += 1
            }
            previousChar = character
        }
        return deletionsCount
    }
    

}
