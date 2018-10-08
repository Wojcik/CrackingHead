//
//  QueueFromStacks.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/8/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/* Queues: A Tale of Two Stacks
 https://www.hackerrank.com/challenges/ctci-queue-using-two-stacks/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=stacks-queues
 */

import Foundation

class QueueFromStacks: BaseProblem {
    func exec() {
        let operations = [(1,42), (2, 0), (1, 14), (3, 0), (1, 28), (3, 0), (1, 60), (1, 78), (2, 0), (2, 0)]
        processQueues(operations)
    }
    
    func processQueues(_ q:[(Int, Int)]) {
        var firstStack = [Int]()
        var secondStack = [Int]()
        for queue in q {
            switch queue.0 {
            case 1:
                firstStack.append(queue.1)
            case let q where q == 2 || q == 3:
                if secondStack.count == 0 {
                    while let value = firstStack.popLast() {
                        secondStack.append(value)
                    }
                }
                if q == 2 {
                    secondStack.popLast()
                } else {
                    print(secondStack.last)
                }
            default:
                assertionFailure("Wrong queue")
            }
        }
    }
}
