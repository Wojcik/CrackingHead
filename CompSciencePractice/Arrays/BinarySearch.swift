//
//  BinarySearch.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/30/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa


class BinarySearch <T> where T:Comparable, T:Numeric {
    func binarySearch(array:[T], term:T) -> Int? {
        return binarySearch(array: array, term: term, start:0, end:array.count - 1)
    }
    
    @discardableResult fileprivate func binarySearch(array:[T], term:T, start:Int, end:Int) -> Int? {
        guard start < end else {
            return nil
        }
        let middle = start + (end - start)/2
        let value = array[middle]
        var start = start
        var end = end
        if value == term {
            return middle
        } else if (value < term) {
            start = middle + 1
        } else if (value > term) {
            end = middle - 1
        }
        return binarySearch(array: array, term: term, start: start, end: end)
    }
}
