//
//  CommonChild.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/4/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class CommonChild: BaseProblem {
    func exec() {
        let left = "ABBA"
        let right = "BABA"
        print(commonChild(s1: left, s2: right))
    }
    
    func commonChild(s1: String, s2: String) -> Int {
        var lcsArray = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: s1.count + 1)
        let left = Array(s1)
        let right = Array(s2)
        
        for i in 1...left.count {
            for j in 1...right.count {
                if left[i-1] == right[j-1] {
                    lcsArray[i][j] = lcsArray[i-1][j-1] + 1
                } else {
                    lcsArray[i][j] = max(lcsArray[i-1][j], lcsArray[i][j-1])
                }
            }
        }
        lcsArray.debugPrint()
        return lcsArray[s1.count][s2.count]
        
    }
}
