//
//  SortStack.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/7/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class SortStack: BaseProblem {
    func exec() {
        var stack = Stack<Int>()
        stack.push(10)
        stack.push(2)
        stack.push(1)
        stack.push(4)
        stack.push(3)
        stack.push(7)
        stack.push(5)
        stack.push(6)
        print(sortStack(stack).debugDesc())
    }
    
    func sortStack(_ stack:Stack<Int>) -> Stack<Int> {
        let sorted = Stack<Int>()
        while !stack.isEmpty() {
            let top = stack.pop()!
            if sorted.isEmpty() {
                sorted.push(top)
            } else {
                while let sortedTop = sorted.peek(), sortedTop > top {
                    stack.push(sorted.pop()!)
                }
                sorted.push(top)
            }

            
        }
        return sorted
    }
}
