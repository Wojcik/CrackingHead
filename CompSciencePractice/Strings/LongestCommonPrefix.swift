//
//  LongestCommonPrefix.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/18/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class LongestCommonPrefix: BaseProblem {
    
    func exec() {
        print(longestCommonPrefix(["aca","cba"]))
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        let strs = strs.map {Array($0)}
        var prefix = ""
        var i = 0
        while i < strs.first!.count {
            let char = strs.first![i]
            for j in 1..<strs.count {
                if  i >= strs[j].count || strs[j][i] != char {
                    return prefix
                }
            }
            prefix += String(char)

            i += 1
        }
        return prefix
    }
}
