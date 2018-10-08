//
//  BalancedBrackets.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/8/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/* Balanced Brackets
 https://www.hackerrank.com/challenges/balanced-brackets/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=stacks-queues
 */

import Foundation

class BalancedBrackets: BaseProblem {

    
    func exec() {
        let string = "{{[(()))]}}"
        print(isBalanced(string))
    }
    
    func isBalanced(_ s:String) -> String {
        let brackets = ["{":"}", "(":")", "[":"]"]
        var stack = [String]()
        for char in s {
            if brackets.keys.contains(String(char)) {
                stack.append(brackets[String(char)]!)
            } else {
                if stack.popLast() != String(char) {
                    return "NO"
                }
            }
        }
        return stack.isEmpty ? "YES" : "NO"
    }
}
