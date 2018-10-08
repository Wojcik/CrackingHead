//
//  Stack.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/8/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class Stack<T>: NSObject {
    private var array = [T]()
    
    func push(_ item:T) {
        array.append(item)
    }

    func pop() -> T? {
        return array.popLast()
    }
    
    func last() -> T? {
        return array.last
    }
}
