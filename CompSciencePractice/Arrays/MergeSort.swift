//
//  MergeSort.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/29/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class MergeSort: BaseProblem {
    func exec() {
        let array = [2,4,1,3,5]
        print(mergeSort(array))
    }
    
    func mergeSort(_ array:[Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        let middle = array.count/2
        let leftPart = mergeSort(Array(array[0..<middle]))
        let rightPart = mergeSort(Array(array[middle..<array.count]))
        return merge(leftPart, rightPart)
    }
    
    func merge(_ left:[Int], _ right:[Int]) -> [Int] {
        var sorted = [Int]()
        var i = 0
        var j = 0
        while i < left.count && j < right.count {
            if left[i] < right[j] {
                sorted.append(left[i])
                i += 1
            } else if left[i] > right[j] {
                sorted.append(right[j])
                j += 1
            } else {
                sorted.append(left[i])
                sorted.append(right[j])
                i += 1
                j += 1
            }
        }
        while i < left.count {
            sorted.append(left[i])
            i += 1
        }
        while j < right.count {
            sorted.append(right[j])
            j += 1
        }
        return sorted
    }
}
