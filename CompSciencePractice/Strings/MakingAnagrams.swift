//
//  MakingAnagrams.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/2/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class MakingAnagrams: BaseProblem {
    func exec() {
        let string1 = "abba"
        let string2 = "cb"
        print(makeAnagram(a: string1, b: string2))
    }
    
    func makeAnagram(a: String, b: String) -> Int {
        var charactersToRemoveCount = 0
        var firstStringCharactersCount = Array(repeating: 0, count: String.lowercaseCharactersRange().count)
        for character in a {
            firstStringCharactersCount[Int(character.toASCII())] += 1
        }
        for character in b {
            let count = firstStringCharactersCount[Int(character.toASCII())]
            if count == 0 {
                charactersToRemoveCount += 1
            } else {
                firstStringCharactersCount[Int(character.toASCII())] -= 1
            }
        }
        return charactersToRemoveCount + firstStringCharactersCount.reduce(into: 0) { result, value in
            result += value
        }
    }
}
