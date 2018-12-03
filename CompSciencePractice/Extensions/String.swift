//
//  String.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/30/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

extension String {
    func toIntArray() -> [Int] {
        return self.split(separator: " ").map{Int($0)!}
    }
}
