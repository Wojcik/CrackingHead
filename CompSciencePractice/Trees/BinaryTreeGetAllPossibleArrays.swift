//
//  BinaryTreeGetAllPossibleArrays.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/20/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class BinaryTreeGetAllPossibleArrays: BaseProblem {
    func exec() {
        let tree = binarySearchTree()
        print(allArrays(root:tree))
    }
    
    func allArrays(root:Node?) -> [[Int]] {
        var result = [[Int]]()
        guard let node = root else {
            result.append([Int]())
            return result
        }
        
        let leftTreeArrays = allArrays(root: node.left)
        let rightTreeArrays = allArrays(root: node.right)
        var prefix = [node.data]
        for var leftArray in leftTreeArrays {
            for var rightArray in rightTreeArrays {
                var weaved = [[Int]]()
                weave(&leftArray, &rightArray, &weaved, &prefix)
                result.append(contentsOf: weaved)
            }
        }
        return result
    }
    
    func weave(_ left:inout [Int], _ right:inout [Int], _ weaved:inout [[Int]], _ prefix:inout [Int]) {
        if left.isEmpty || right.isEmpty {
            var result = prefix
            result.append(contentsOf: left)
            result.append(contentsOf: right)
            weaved.append(result)
            return
        }
        let leftHead = left.removeFirst()
        prefix.append(leftHead)
        weave(&left, &right, &weaved, &prefix)
        prefix.removeLast()
        left.insert(leftHead, at: 0)
        
        let rightHead = right.removeFirst()
        prefix.append(rightHead)
        weave(&left, &right, &weaved, &prefix)
        prefix.removeLast()
        right.insert(rightHead, at: 0)
    }
}
