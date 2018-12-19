//
//  ReverseInteger.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/17/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class ReverseInteger: BaseProblem {
    func exec() {
        let input = 123
        print(reverse(input))
    }
    
    func reverse(_ x: Int) -> Int {
        var input = x
        var output = 0
        var mod = 10
        while input != 0 {
            let num = input % mod
            output *= 10
            output +=  (num / (mod / 10))
            if output > Int(Int32.max) || output < Int(Int32.min) {
                return 0
            }
            input -= num
            mod *= 10
        }
        return output
    }
}
