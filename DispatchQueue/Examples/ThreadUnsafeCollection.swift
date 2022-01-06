//
//  ThreadUnsafeCollection.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

struct ThreadUnsafeCollectionLightExample: Executable {

    let concurrentQueue = DispatchQueue(label: "com.gcd.myConcurrentQueue", attributes: [.concurrent])

    func execute() {
        var array: [Int] = []
        let group = DispatchGroup()
        concurrentQueue.async(group: group) {
            WorkSimulator().simulateWork()
            array.append(1)
        }
        concurrentQueue.async(group: group) {
            WorkSimulator().simulateWork()
            array.append(2)
        }
        concurrentQueue.async(group: group) {
            WorkSimulator().simulateWork()
            array.append(3)
        }
        concurrentQueue.async(group: group) {
            WorkSimulator().simulateWork()
            array.append(4)
        }
        concurrentQueue.async(group: group) {
            WorkSimulator().simulateWork()
            array.append(5)
        }
        group.wait()
        print("Скачанные песни:", array)
    }
}

struct ThreadUnsafeCollectionHardcoreExample: Executable {

    let concurrentQueue = DispatchQueue(label: "com.gcd.myConcurrentQueue", attributes: [.concurrent])
    
    func doSomeAsyncWork(completion: (([Int]) -> Void)?) {
        var array: [Int] = []
        let group = DispatchGroup()
        (0...10).forEach({ int in
            concurrentQueue.async(group: group) {
                WorkSimulator().simulateWork()
                array.append(int)
            }
        })
        group.wait()
        completion?(array)
    }

    func execute() {
        (0...10).forEach({ _ in
            doSomeAsyncWork(completion: { print("Скачанные песни:", $0.sorted()) })
        })
    }
}
