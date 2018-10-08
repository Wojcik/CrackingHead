//
//  SherlockAndValidString.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/2/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class SherlockAndValidString: BaseProblem {
    func exec() {
        let string = "abcdefghhgfedecba"
        print(isValid(s: string))
    }
    
    func isValid(s: String) -> String {
        enum Result:String {
            case YES
            case NO
        }
        var maxDeletions = 1
        
        var charactersCount = Array(repeating: 0, count: String.lowercaseCharactersRange().count)
        for character in s {
            charactersCount[character.toASCII()] += 1
        }
        
        var previousCount = charactersCount.first!
        for count in charactersCount {
            if count > 0, count != previousCount {
                maxDeletions -= abs(count - previousCount)
            } else {
                previousCount = count
            }
            if maxDeletions < 0 {
                return Result.NO.rawValue
            }
        }

        return Result.YES.rawValue
    }
}
