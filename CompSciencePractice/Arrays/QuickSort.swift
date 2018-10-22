//
//  QuickSort.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/17/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class QuickSort: BaseProblem {
    func exec() {
        var array  = [7,2,3,5,6,4,1,8,9]
        quickSort(array: &array, start: 0, end: array.count - 1)
        print(array)
    }
    
    func quickSort(array:inout [Int], start:Int, end:Int) {
        if start < end {
            let partitionIndex = partition(array: &array, start: start, end: end)
            quickSort(array: &array, start: start, end: partitionIndex - 1)
            quickSort(array: &array, start: partitionIndex + 1, end: end)
        }
    }
    
    func partition(array:inout [Int], start:Int, end:Int) -> Int {
        var partitionIndex = start
        let pivot = array[end]
        for i in start..<end {
            if array[i] <= pivot {
                array.swapAt(i, partitionIndex)
                partitionIndex += 1
            }
        }
        array.swapAt(partitionIndex, end)
        return partitionIndex
    }
}
