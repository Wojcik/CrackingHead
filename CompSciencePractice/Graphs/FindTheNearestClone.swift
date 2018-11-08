//
//  FindTheNearestClone.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/1/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa
/*
 Problem description - https://www.hackerrank.com/challenges/find-the-nearest-clone/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=graphs
 */
class FindTheNearestClone: BaseProblem {
    enum Color:Int {
        case white
        case black
        case gray
    }
    
    func exec() {
        let edges = """
        1 2
        1 3
        4 2
        """
        let colors = "1 2 3 4".split(separator: " ").map {Int($0)!}
        let graphNodesEdges = edges.split(separator: "\n").map {$0.split(separator: " ").map {Int($0)!}}
        let graphFrom = graphNodesEdges.compactMap {$0[0]}
        let graphTo = graphNodesEdges.compactMap {$0[1]}
        print(findShortest(graphNodes: colors.count, graphFrom: graphFrom, graphTo: graphTo, ids: colors, val: 2))
    }
    
    func findShortest(graphNodes: Int, graphFrom: [Int], graphTo: [Int], ids: [Int], val: Int) -> Int {
        var adjList = Array(repeating: [Int](), count: graphNodes)
        for i in 0..<graphFrom.count {
            adjList[graphFrom[i] - 1].append(graphTo[i] - 1)
            adjList[graphTo[i] - 1].append(graphFrom[i] - 1)
        }
        var length = Int.max
        var visitedNodes = [Int:(Int, Int)]()
        var queue = [Int]()
        for node in 0..<adjList.count {
            if ids[node] == val {
                queue.append(node)
                visitedNodes[node] = (node, 0)
            }
        }
        var metNodes = [Int:Int]()
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            for i in 0..<adjList[node].count {
                let sibling = adjList[node][i]
                if visitedNodes[sibling] == nil {
                    queue.append(sibling)
                    visitedNodes[sibling] = (node, visitedNodes[node]!.1 + 1)
                } else if visitedNodes[sibling]!.0 != visitedNodes[node]!.0 && metNodes[node] != sibling && metNodes[sibling] != node {
                    if ids[visitedNodes[node]!.0] == val {
                        metNodes[node] = sibling
                        let pathLength = visitedNodes[node]!.1 + visitedNodes[sibling]!.1 + 1
                        length = min(length, pathLength)
                        visitedNodes[sibling] = (visitedNodes[sibling]!.0, pathLength)
                    }
                }
            }
        }
        return metNodes.count > 0 ? length : -1
    }
}
