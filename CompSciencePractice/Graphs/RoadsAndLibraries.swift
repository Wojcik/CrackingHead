//
//  RoadsAndLibraries.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/31/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//
/*
 Problem description - https://www.hackerrank.com/challenges/torque-and-development/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=graphs
 */
import Cocoa

class RoadsAndLibraries: BaseProblem {
    
    func exec() {
        let citiesCount = 5
        let cities = [[1, 2], [1, 3], [1, 4]]
        print(roadsAndLibraries(n: citiesCount, c_lib: 6, c_road: 1, cities: cities))
    }
    
    func roadsAndLibraries(n:Int, c_lib: Int, c_road: Int, cities: [[Int]]) -> Int {
        if c_lib <= c_road {
            return n*c_lib
        }
        var price = 0
        var adjList = Array(repeating: [Int](), count: n + 1)
        var visitedNodes = Array(repeating: false, count: n + 1)
        for road in cities {
            adjList[road[0]].append(road[1])
            adjList[road[1]].append(road[0])
        }
        print(adjList.debugPrint())
        var components = [Int]()
        for i in 1...n {
            if visitedNodes[i] == false {
                components.append(dfs(adjList, i, visitedNodes: &visitedNodes))
            }
        }
        
        for nodesInComponent in components {
            price += (nodesInComponent - 1)*c_road + c_lib
        }
        return price
    }
    
    func dfs(_ graph:[[Int]], _ node:Int, visitedNodes:inout [Bool]) -> Int {
        visitedNodes[node] = true
        var numberOfNodes = 1
        for adjNode in graph[node] {
            if visitedNodes[adjNode] == false {
                numberOfNodes += dfs(graph, adjNode, visitedNodes: &visitedNodes)
            }
        }
        return numberOfNodes
    }
    
}
