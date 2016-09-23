//
//  Async.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/23.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

enum Result<T, U> {
    case Success(T)
    case Failure(U)
}

class Async<T, U> {
    
    typealias Process = (Result<T, U> -> ()) -> ()
    typealias ProcessWithArgument = (argument: T, Result<T, U> -> ()) -> ()
    
    func parallel(processes processes: [Process], completion: Result<[T], U> -> ()) {
        var hasFailed = false
        var successObjects = [T?](count: processes.count, repeatedValue: nil)
        
        let group = dispatch_group_create()
        for (index, process) in processes.enumerate() {
            dispatch_group_enter(group)
            process({ result in
                switch result {
                case .Success(let object):
                    successObjects[index] = object
                    dispatch_group_leave(group)
                case .Failure(let object):
                    if !hasFailed {
                        hasFailed = true
                        completion(.Failure(object))
                    }
                }
            })
        }
        dispatch_group_notify(group, dispatch_get_main_queue()) { 
            completion(.Success(successObjects.flatMap({ $0 })))
        }
    }
    
    func serial(processes processes: [Process], completion: Result<[T], U> -> ()) {
        var successObjects = [T]()
        
        func execute(index: Int) {
            guard 0..<processes.count ~= index else {
                completion(.Success(successObjects))
                return
            }
            let process = processes[index]
            process { result in
                switch result {
                case .Success(let object):
                    successObjects.append(object)
                    execute(index + 1)
                case .Failure(let object):
                    completion(.Failure(object))
                }
            }
        }
        execute(0)
    }
    
    func waterfall(argument argument: T, processes: [ProcessWithArgument], completion: Result<T, U> -> ()) {
        func execute(argument: T, index: Int) {
            guard 0..<processes.count ~= index else {
                completion(.Success(argument))
                return
            }
            let process = processes[index]
            process(argument: argument) { result in
                switch result {
                case .Success(let object):
                    execute(object, index: index + 1)
                case .Failure(let object):
                    completion(.Failure(object))
                }
            }
        }
        execute(argument, index: 0)
    }
}
