//
//  ConcurrentQueue.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

struct ConcurrentQueueSyncExample: Executable {
    
    let concurrentQueue = DispatchQueue(label: "com.gcd.myConcurrentQueue", attributes: [.concurrent])
    
    func execute() {
        concurrentQueue.sync {
            WorkSimulator().simulateWork()
            print("SyncWork1 done")
        }
        concurrentQueue.sync {
            WorkSimulator().simulateWork()
            print("SyncWork2 done")
        }
        concurrentQueue.sync {
            WorkSimulator().simulateWork()
            print("SyncWork3 done")
        }
    }
}
struct ConcurrentQueueAsyncExample: Executable {
    
    let concurrentQueue = DispatchQueue(label: "com.gcd.myConcurrentQueue", attributes: [.concurrent])
    
    func execute() {
        concurrentQueue.async {
            WorkSimulator().simulateWork()
            print("SyncWork1 done")
        }
        concurrentQueue.async {
            WorkSimulator().simulateWork()
            print("SyncWork2 done")
        }
        concurrentQueue.async {
            WorkSimulator().simulateWork()
            print("SyncWork3 done")
        }
    }
}
