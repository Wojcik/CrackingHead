//
//  WaysToFormNumber.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/12/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class WaysToFormNumber: BaseProblem {
    func exec() {
        let input = "1 3 5".toIntArray()
        var memo = Array(repeating: -1, count: 6 + 1)
        print(waysToFormNumber(6, fromDigits: input, memo:&memo))
    }
    
    func waysToFormNumber(_ number:Int, fromDigits:[Int], memo:inout [Int]) -> Int {
        if number < 0 {
            return 0
        }
        if number == 0 {
            return 1
        }
        if memo[number] != -1 {
            return memo[number]
        }
        var count = 0
        for digit in fromDigits {
            count += waysToFormNumber(number - digit, fromDigits:fromDigits, memo: &memo)
        }
        memo[number] = count
        return count
    }
}
