//
//  RecursionAndBacktracking.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/29/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class RecursionAndBacktracking: BaseProblem {
    func exec() {
        print(fib(3))
    }
    
    func fib(_ value:Int) -> Int {
        if value == 1 {
            return 1
        } else if value < 1{
            return 0
        }
        return fib(value - 1) + fib(value - 2)
    }
}
