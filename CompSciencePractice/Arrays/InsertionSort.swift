//
//  InsertionSort.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/22/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class InsertionSort: BaseProblem {
    func exec() {
        let array = [1,3,4,4,2,0,7,9,8]
        print(insertionSort(array: array))
    }
    
    func insertionSort(array:[Int]) -> [Int] {
        var a = array
        for i in 1..<a.count {
            let value = a[i]
            var newPosition = i
            while newPosition > 0 && a[newPosition-1] > value {
                a[newPosition] = a[newPosition-1]
                newPosition -= 1
            }
            a[newPosition] = value
        }
        return a
    }
}
