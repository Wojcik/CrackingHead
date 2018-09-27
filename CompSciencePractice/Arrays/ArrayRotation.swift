//
//  ArrayRotation.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/24/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class ArrayRotation: NSObject {
    class func exec() {
        print(rotLeft(a: [1,2,3,4,5,6], d: 4))
    }
    
    class func rotLeft(a: [Int], d: Int) -> [Int] {
        var newArray = [Int](repeating: 0, count: a.count)
        for i in 0..<a.count {
            newArray[i] = a[(i + d)%a.count]
        }
        return newArray
    }
}
