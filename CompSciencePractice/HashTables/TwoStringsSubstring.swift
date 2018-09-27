//
//  TwoStringsSubstring.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/26/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class TwoStringsSubstring: BaseProblem {
    func exec() {
        let first = "Be pblem"
        let second = "Two strings"
        print(twoStrings(s1: first, s2: second))
    }
    
    func twoStrings(s1: String, s2: String) -> String {
        var lettersCount = s1.reduce(into: [Character:Int]()) { (result: inout [Character:Int], character) in
            if String(character) != " " {
                result[character] = 1
            }
        }
        for character in s2 {
            if lettersCount[character] != nil {
                print(character)
                return "YES"
            }
        }
        return "NO"
    }
}
