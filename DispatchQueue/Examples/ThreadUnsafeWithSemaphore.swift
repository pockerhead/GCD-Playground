//
//  ThreadUnsafeWithSemaphore.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

struct ThreadUnsafeWithSemaphoreExample: Executable {

    let semaphore = DispatchSemaphore(value: 1)
    let concurrentQueue = DispatchQueue(label: "com.gcd.myConcurrentQueue", attributes: [.concurrent])
    
    func doSomeAsyncWork(completion: (([Int]) -> Void)?) {
        var array: [Int] = []
        let group = DispatchGroup()
        (0...10).forEach({ int in
            concurrentQueue.async(group: group) {
                WorkSimulator().simulateWork()
                self.semaphore.wait()
                array.append(int)
                self.semaphore.signal()
            }
        })
        group.wait()
        completion?(array)
    }

    func execute() {
        (0...10).forEach({ _ in
            doSomeAsyncWork(completion: { print("Скачанные песни:", $0) })
        })
    }
}
