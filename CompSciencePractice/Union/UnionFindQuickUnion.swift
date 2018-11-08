//
//  UnionFindQuickUnion.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/1/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

public struct UnionFindQuickUnion {
    private var index = [Int:Int]()
    private var union = [Int]()
    private var size = [Int]()
    
    public mutating func addSet(_ set:Int) {
        if index[set] != nil {
            return
        }
        index[set] = union.count
        union.append(union.count)
        size.append(1)
    }
    
    public mutating func setByIndex(_ index:Int) -> Int {
        if union[index] == index {
            return union[index]
        } else {
            union[index] = setByIndex(union[index])
            return union[index]
        }
    }
    
    public mutating func setOf(_ element:Int) -> Int? {
        if index[element] == nil {
            return nil
        }
        return setByIndex(element)
    }
    
    public mutating func uniteSetsContaining(_ first:Int, _ second:Int) {
        if let firstSet = setOf(first), let secondSet = setOf(second) {
            union[firstSet] = secondSet
            size[secondSet] += size[firstSet]
        }
    }
}
