//
//  FindAnagrams.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/9/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class FindAnagrams: BaseProblem {
    func exec() {
        let string = "ADOBECODE"
        let subString = "BCE"
        print(findAnagrams(s: string, p: subString))
    }
    
    func findAnagrams(s:String, p:String) -> [Int] {
        var anagramsIndexes = [Int]()
        var charsCount = getCharsCountDict(p)
        let string = Array(s)
        var counter = charsCount.keys.count
        var start = 0
        var end = 0
        
        while end < string.count {
            let char = string[end]
            if let count = charsCount[char] {
                charsCount[char]  = count - 1
                if charsCount[char] == 0 {
                    counter -= 1
                }
            }
            end += 1
            while counter == 0 {
                if end - start == p.count {
                    anagramsIndexes.append(start)
                }
                let beginChar = string[start]
                if let count = charsCount[beginChar] {
                    charsCount[beginChar] = count + 1
                    if charsCount[beginChar]! > 0 {
                        counter += 1
                    }
                }
                start += 1
            }
        }
        
        print(charsCount)
        return anagramsIndexes
    }
    
    func getCharsCountDict(_ string:String) -> [Character:Int] {
        var charsCount = [Character:Int]()
        for character in string {
            charsCount[character] = charsCount[character] ?? 0 + 1
        }
        return charsCount
    }
}

