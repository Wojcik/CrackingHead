//
//  AddBinaries.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/23/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class AddBinaries {
    class func exec() {
        let result = add("111011001", "011")
        print(class_getName(self), " result is ",result)
    }
    
    private class func add(_ lhs:String, _ rhs:String) -> String {
        print(String(Int(lhs, radix:2)! + Int(rhs, radix:2)!, radix:10))
        let first:String
        let second:String
        if lhs.count >= rhs.count {
            first = lhs
            second = rhs
        } else {
            first = rhs
            second = lhs
        }
        var result:String = ""
        var carry = 0
        
        var leftStartPointer = first.endIndex
        var rightStartPointer = second.endIndex
        while leftStartPointer > first.startIndex {
            leftStartPointer = first.index(before: leftStartPointer)
            var charRight = String(carry).first!
            if (rightStartPointer > second.startIndex) {
                rightStartPointer = second.index(before: rightStartPointer)
                charRight = second[rightStartPointer]
            }
            let charLeft = first[leftStartPointer]

            var sum:String = ""
            switch (charLeft, charRight) {
                case ("0","1"), ("1", "0") :
                    sum = "1"
                    if carry == 1 {
                        sum = "0"
                    }
                case ("0", "0") :
                    sum = "0"
                    if carry == 1 {
                        sum = "1"
                        carry = 0
                    }
                case ("1", "1") :
                    sum = "0"
                    if carry == 1 {
                        sum = "1"
                    }
                    carry = 1
                default:
                    assertionFailure("Unexpexted Input")
            }
            result = sum + result
        }
        if (carry == 1) {
            result = "1" + result
        }
        print(Int(result, radix:2)!)
        return result
    }
    
}

/*
'0001'
'1001'
 1010
 
 17 + 9 = 26
 
 111
 011
    10
*/

