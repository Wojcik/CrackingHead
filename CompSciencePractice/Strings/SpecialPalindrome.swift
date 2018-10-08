//
//  SpecialPalindrome.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/2/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class SpecialPalindrome: BaseProblem {
    
    func exec() {
        let string = "asdasdawsfffffasa"
        print(substrCount(n: string.count, s: string))
    }
    
    func substrCount(n: Int, s: String) -> Int {
        let array = Array(s)
        var substringsCount = 0
        
        charsLoop: for (index, char) in array.enumerated() {
            substringsCount += 1

            var offset = 1
            guard index + offset < n else {
                break
            }
            var nextChar = array[index + offset]
            var endReached = false
            while nextChar == char { // search untill sequence of equal characters breaks
                offset += 1
                substringsCount += 1
                if ((offset + index) >= n) {
                    endReached = true
                    break
                }
                nextChar = array[index + offset]
            }
            if (endReached || index + offset + 1 >= n || index+offset + 1 + offset > n) {
                continue
            }
            
            if array[index ..< index + offset].elementsEqual(array[index+offset + 1..<index+offset + 1 + offset]) {
                substringsCount += 1
            }
            
        }
        return substringsCount
    }

}
