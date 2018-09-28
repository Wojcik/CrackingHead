//
//  Utils.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/28/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class Utils: NSObject {
    class func factorial(n:Int) -> Int {
        guard n > 0 else {
            return 1
        }
        var result = 1
        for i in 1...n {
            result *= i
        }
        return result
    }
}
