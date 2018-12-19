//
//  RunningMedian.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/13/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class RunningMedian: BaseProblem {
    func exec() {
        let input = "12 4 5 3 8 7".toIntArray()
        findMedian(input)
    }
    
    func findMedian(_ input:[Int]) {
        var heap = [Int]()
        for value in input {
            addValueToHeap(value, heap: &heap)
            print(heap)
            let middle = heap.count / 2
            var median = 0.0
            if heap.count % 2 != 0 {
                median = Double(heap[middle])
            } else {
                let left = middle - 1
                let right = middle
                median = Double(heap[left] + heap[right])/2.0
            }
            print(String(format: "%.1f", median))
        }
    }
    
    func addValueToHeap(_ value:Int, heap:inout [Int]) {
        heap.append(value)
        shiftUpFromIndex(heap.count - 1, heap:&heap)
    }
    
    func shiftUpFromIndex(_ index:Int, heap:inout [Int]) {
        if index == 0 {
            return
        }
        let parentIndex = (index - 1)/2
        if heap[parentIndex] < heap[index] {
            heap.swapAt(parentIndex, index)
            shiftUpFromIndex(parentIndex, heap: &heap)
        }
    }
}
