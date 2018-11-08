//
//  Palindrome.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/2/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class Palindrome: BaseProblem {
    func exec() {
        print(isPalindrome("ABBAABBA"))
    }
    
    func isPalindrome(_ string:String) -> Bool {
        var characters = Array(string)
        var start = 0
        var end = characters.count - 1
        while start <= end {
            if characters[start] != characters[end] {
                return false
            }
            start += 1
            end -= 1
        }
        return true
    }
}
