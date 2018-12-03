//
//  TripleSum.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/29/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/triple-sum/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=search&h_r=next-challenge&h_v=zen
 */

import Cocoa

class TripleSum: BaseProblem {
    
    func exec() {
        let arrays = """
        1 4 5
        2 3 3
        1 2 3
        """.split(separator: "\n").map{$0.split(separator: " ").map{Int($0)!}}
        print(triplets(a: arrays[0], b: arrays[1], c: arrays[2]))
    }
    
    func triplets(a: [Int], b: [Int], c: [Int]) -> Int {
        //removing dublicates and sort
        let a = Array(Set(a)).sorted()
        let b = Array(Set(b)).sorted()
        let c = Array(Set(c)).sorted()
        
        var ai = 0
        var bi = 0
        var ci = 0
        var count = 0
        while bi < b.count {
            while ai < a.count && a[ai] <= b[bi] {
                ai += 1
            }
            while ci < c.count && c[ci] <= b[bi] {
                ci += 1
            }
            bi += 1
            count += ai*ci
        }
        return count
    }
}
