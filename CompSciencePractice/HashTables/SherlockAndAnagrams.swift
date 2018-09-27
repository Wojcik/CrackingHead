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
        let string = "ifailuhkqqhucpoltgtyovarjsnrbfpvmupwjjjfiwwhrlkpekxxnebfrwibylcvkfealgonjkzwlyfhhkefuvgndgdnbelgruel"
        print(sherlockAndAnagrams(s: string))
        
    }
    func sherlockAndAnagrams(s: String) -> Int {
        var stringSize = 1
        var dict = [Int:[Substring]]()
        while stringSize < s.count {
            var stringBegin = s.startIndex
            while stringBegin <= s.index(s.endIndex, offsetBy: -1*stringSize) {
                let stringTail = s.index(stringBegin, offsetBy: stringSize)
                let substring = s[stringBegin..<stringTail]
                dict[substring.count, default:[Substring]()].append(substring)
                stringBegin = s.index(after: stringBegin)
            }
            stringSize += 1
        }
        
        var anagramsCount = 0
        for lenght in 2...dict.values.count {
            let substringsSet = dict[lenght]!
            for i in 0..<substringsSet.count {
                for j in i+1..<substringsSet.count {
                    if isAnagram(string: substringsSet[i], substring: substringsSet[j]) {
                        anagramsCount += 1
                    }
                }
            }
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
