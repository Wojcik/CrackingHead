//
//  Queries.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/1/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

enum QueryType : Int {
    case AppendQueryType = 1
    case DeleteQueryType = 2
    case FrequencyQueryType = 3
}

class Queries: BaseProblem {
    func exec() {
        let queries = [[1,1],[1,1],[2,2],[1,2],[1,2],[3,2]]
        print(freqQuery(queries: queries))
    }
    
    func freqQuery(queries: [[Int]]) -> [Int] {
        var operations = Array(repeating:[Int: Int](), count: 3)
        var results = [Int]()
        for queryObject in queries {
            assert(queryObject.count == 2, "Wrong query")
            let value = queryObject[1]
            if let query =  QueryType(rawValue:queryObject[0]){
                switch query {
                case .AppendQueryType:
                    if let count = operations[query.rawValue - 1][value] {
                        operations[query.rawValue - 1][value] = count + 1
                    } else {
                        operations[query.rawValue - 1][value] = 1
                    }
                case .DeleteQueryType:
                    if let count = operations[QueryType.AppendQueryType.rawValue - 1][value] {
                        operations[QueryType.AppendQueryType.rawValue - 1][value] = count - 1
                    }
                case .FrequencyQueryType:
                    var hasFrequncy = false
                    for counts in operations[QueryType.AppendQueryType.rawValue - 1].values {
                        if counts == value {
                            hasFrequncy = true
                            break
                        }
                    }
                    results.append(hasFrequncy ? 1 : 0)
                }
                print(query)
            } else {
                assert(false, "Wrong query type - \(queryObject[0])")
            }

        }
        return results
    }
}
