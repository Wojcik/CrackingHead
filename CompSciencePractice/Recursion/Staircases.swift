//
//  Staircases.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/7/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class Staircases: BaseProblem {
    
    func exec() {
        print(stepPerms(n: 35))
    }
    
    func stepPerms(n: Int) -> Int {
        var memo = [Int:Int]()
        return stepPerms(n: n, memo: &memo)
    }
    
    func stepPerms(n: Int, memo:inout [Int:Int]) -> Int {
        if n == 0 || n == 1 {
            return 1
        }
        if n < 0 {
            return 0
        }
        if let value = memo[n] {
            return value
        } else {
            let result = (stepPerms(n:n-3, memo:&memo) + stepPerms(n:n-2, memo:&memo) + stepPerms(n:n-1, memo:&memo))%10000000007
            memo[n] = result
            return result
        }
    }
}

