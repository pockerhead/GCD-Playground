//
//  ThreadSafeCollection.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

struct ThreadSafeCollectionExample: Executable {
    
    let concurrentQueue = DispatchQueue(label: "com.gcd.myConcurrentQueue", attributes: [.concurrent])
    
    func doSomeWorkWithDifferentCollections(completion: ((ThreadSafeArray<Int>) -> Void)?) {
        var array: ThreadSafeArray<Int> = []
        let group = DispatchGroup()
        (0...10).forEach({ value in
            concurrentQueue.async(group: group) {
                WorkSimulator().simulateWork()
                array.append(value)
            }
        })
        group.wait()
        completion?(array)
    }
    
    func execute() {
        (0...10).forEach({ _ in
            doSomeWorkWithDifferentCollections(completion: { arr in
                print(arr)
            })
        })
    }
}
