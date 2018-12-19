//
//  LongestPalindrome.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/17/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class LongestPalindrome: BaseProblem {
    func exec() {
        print(longestPalindrome("ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"))
    }
    
    func longestPalindrome(_ s: String) -> String {
        var result = ""
        
        let inputArray = Array(s)
        var dp = Array(repeating: Array(repeating: 0, count: inputArray.count), count: inputArray.count)
      
        for i in 0..<dp.count {
            dp[i][i] = 1
        }
        
        for i in stride(from: dp.count - 1, to: -1, by: -1) {
            for j in i..<dp[i].count {
                if inputArray[i] == inputArray[j] {
                    if j - i < 3 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = dp[i+1][j-1]
                    }
                    
                    if dp[i][j] == 1 {
                        if result.count < j - i + 1 {
                            result = String(inputArray[i...j])
                        }
                    }
                }
            }
        }
        return result
    }
    
}
