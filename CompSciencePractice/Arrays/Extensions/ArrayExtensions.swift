//
//  ArrayExtensions.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/4/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int> {
    func debugPrint() {
        for childArray in self {
            let stringsArray = childArray.map() {
                return String($0)
            }
            print((stringsArray as! Array<String>).joined(separator: " "))
        }
    }
}
