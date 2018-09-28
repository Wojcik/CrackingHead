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
        let string = "bbcbacaabacacaaacbbcaabccacbaaaabbcaaaaaaaccaccabcacabbbbabbbbacaaccbabbccccaacccccabcabaacaabbcbaca"
        print(sherlockAndAnagrams(s: string))
        
    }
    
    func factorial(_ n:Int) -> NSDecimalNumber {
        guard n > 1 else {
            return 1
        }
        let decimal = NSDecimalNumber(integerLiteral: n)
        return decimal.multiplying(by: factorial(n-1))
    }
    
    func combinationsCount(size:Int) -> Int {
        let nFactorial:NSDecimalNumber = factorial(size)
        let divider = factorial(size - 2).multiplying(by: NSDecimalNumber(integerLiteral: 2))
        return nFactorial.dividing(by: divider).intValue
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
            anagramsCount += combinationsCount(size: count) // 2 taken from n
        }
        return anagramsCount
    }
}
