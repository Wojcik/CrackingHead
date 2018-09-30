//
//  Utils.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/28/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class Utils: NSObject {
    static func factorial(_ n:Int) -> NSDecimalNumber {
        guard n > 1 else {
            return 1
        }
        let decimal = NSDecimalNumber(integerLiteral: n)
        return decimal.multiplying(by: factorial(n-1))
    }
    
    static func combinationsCount(n:Int, k:Int) -> Int {
        let nFactorial:NSDecimalNumber = factorial(n)
        let divider = factorial(n - k).multiplying(by: NSDecimalNumber(integerLiteral: k))
        return nFactorial.dividing(by: divider).intValue
    }
}
