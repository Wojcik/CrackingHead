//
//  SherlockAndAnagrams.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/26/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class SherlockAndAnagrams: BaseProblem {
    func exec() {
        let string = "kkkk"
        print(sherlockAndAnagrams(s: string))
        
    }
    
    func sherlockAndAnagrams(s: String) -> Int {
        var stringSize = 1
        var dict = [String:Int]()
        while stringSize < s.count {
            var stringBegin = s.startIndex
            while stringBegin <= s.index(s.endIndex, offsetBy: -1*stringSize) {
                let stringTail = s.index(stringBegin, offsetBy: stringSize)
                let substring = String(s[stringBegin..<stringTail].sorted())
                dict[substring, default:0] += 1
                stringBegin = s.index(after: stringBegin)
            }
            stringSize += 1
        }
        
        var anagramsCount = 0

        for (_, count) in dict {
            anagramsCount += Utils.factorial(n: count) / (Utils.factorial(n: 2)*Utils.factorial(n: count - 2))
        }
        return anagramsCount
    }
    
    func isAnagram(string:Substring, substring:Substring) -> Bool {
        var stringCharsCount = [Character:Int]()
        for character in string {
            stringCharsCount[character, default:0] += 1
            
        }
        var subCharsCount = [Character:Int]()
        for character in substring {
            subCharsCount[character, default:0] += 1
            
        }

        for (key, value) in stringCharsCount {
            if subCharsCount[key] != value {
                return false
            }
        }
        return true
    }
}
