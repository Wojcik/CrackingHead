//
//  RansomNote.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/25/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa
/*
 Problem description - https://www.hackerrank.com/challenges/ctci-ransom-note/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=dictionaries-hashmaps
 */
class RansomNote: BaseProblem {
    func exec() {
        let magazine = ["give", "me", "one", "grand","grand", "today", "night", "me"]
        let note = ["give", "one", "grand", "grand", "today"]
        checkMagazine(magazine, note: note)
    }
    
    func checkMagazine(_ magazine:[String], note:[String]) {
        var magazineDict = [String:Int]()
        for word in magazine {
            if (magazineDict[word] != nil) {
                magazineDict[word]! += 1
            } else {
                magazineDict[word] = 1
            }
        }
        for word in note {
            if magazineDict[word] ?? 0 > 0 {
                magazineDict[word]! -= 1
            } else {
                print("No")
                return
            }
        }
        print("Yes")
    }
}
