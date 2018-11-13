//
//  ExucuteOrder.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/9/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class ExucuteOrder: BaseProblem {
    class Task:Hashable {
        enum State {
            case None
            case Processing
            case Completed
        }
        
        static func == (lhs: ExucuteOrder.Task, rhs: ExucuteOrder.Task) -> Bool {
            return lhs.hashValue == rhs.hashValue
        }
        var hashValue:Int {
            return taskID.hashValue
        }
        var state = State.None
        var dependenciesCnt = 0
        var dependencies = [Task]()
        let taskID:String
        var executed:Bool = false
        init(taskID:String) {
            self.taskID = taskID
        }
        
        func addDependency(_ task:Task) {
            dependencies.append(task)
            task.dependenciesCnt += 1
        }
    }
    
    func exec() {
        let dependencies = [["a","b"],["f","b"],["b","d"],["f","a"],["d","c"]]
        print(orderFor(dependencies: dependencies))
        print(dfsOrderFor(dependencies: dependencies))
    }
    func dfsOrderFor(dependencies:[[String]]) -> [String]? {
        var orderStack = [String]()
        var tasks = buildDependencies(dependencies: dependencies)
        for task in tasks.values {
            if task.state == .None {
                if doDFSFor(task, orderStack: &orderStack) == false {
                    return nil
                }
            }
        }

        return orderStack
    }
    
    func doDFSFor(_ task:Task, orderStack:inout [String]) -> Bool {
        if task.state == .Processing {
            return false
        }
        if task.state == .None {
            task.state = .Processing
            for subTask in task.dependencies {
                if doDFSFor(subTask, orderStack: &orderStack) == false {
                    return false
                }
            }
            orderStack.append(task.taskID)
            task.state = .Completed
        }
        return true
    }
    
    func orderFor(dependencies:[[String]]) -> [String?]? {
        var tasks = buildDependencies(dependencies: dependencies)

        var order: [String?] = Array(repeating: nil, count: Array(tasks.values).count)

        var arrayEnd = addTasksWithoutDependencies(order: &order, tasks: Array(tasks.values), offset: 0)
        var processed = 0
        while processed < order.count {
            guard let taskId = order[processed] else {
                return nil
            }
            let task = tasks[taskId]!
            for subTask in task.dependencies {
                subTask.dependenciesCnt -= 1
            }
            arrayEnd = addTasksWithoutDependencies(order: &order, tasks: task.dependencies, offset: arrayEnd)
            processed += 1
        }
        return order
    }
    
    func addTasksWithoutDependencies(order:inout [String?], tasks:[Task], offset:Int) -> Int {
        var offset = offset
        for task in tasks {
            if task.dependenciesCnt == 0 {
                order[offset] = task.taskID
                offset += 1
            }
        }
        return offset
    }
    
    private func buildDependencies(dependencies:[[String]]) -> [String:Task] {
        var tasks = [String:Task]()
        for dependency in dependencies {
            let onTaskId = dependency[0]
            let whoTaskId = dependency[1]
            let on = tasks[onTaskId, default:Task(taskID: onTaskId)]
            tasks[onTaskId] = on
            let who = tasks[whoTaskId, default:Task(taskID: whoTaskId)]
            tasks[whoTaskId] = who
            on.addDependency(who)
        }
        return tasks
    }
}
