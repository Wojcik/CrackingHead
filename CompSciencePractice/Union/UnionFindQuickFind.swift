//
//  UnionFind.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/1/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

public struct UnionFindQuickFind {
    private var index = [Int:Int]()
    public private(set) var union = [Int]()
    private var size = [Int]()
    
    public mutating func addSet(_ set:Int) {
        if index[set] != nil {
            return
        }
        index[set] = union.count
        union.append(union.count)
        size.append(1)
    }
    
    public mutating func setOf(_ index:Int) -> Int? {
        if self.index[index] == nil {
            return nil
        }
        return union[index]
    }
    
    public mutating func unionSetsContaining(_ first:Int, _ second:Int) {
        if let firstSet = setOf(first), let secondSet = setOf(second) {
            for index in 0..<union.count {
                if union[index] == firstSet {
                    union[index] = secondSet
                }
            }
            size[secondSet] += size[firstSet]
        }
    }
    
    public mutating func isInSameSet(_ first:Int, _ second:Int) -> Bool {
        if let firstSet = setOf(first), let secondSet = setOf(second) {
            return firstSet == secondSet
        } else {
            return false
        }
    }
}
