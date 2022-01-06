//
//  SerialQueue.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation


struct SerialQueueAsyncExample: Executable {

    let serialQueue = DispatchQueue(label: "com.gcd.mySerialQueue", attributes: [])
    let serialQueueSecond = DispatchQueue(label: "com.gcd.mySecondSerialQueue", attributes: [])

    func execute() {
        print("work started")
        serialQueue.async {
            WorkSimulator().simulateWork(number: 1)
        }
        serialQueue.async {
            WorkSimulator().simulateWork(number: 2)
        }
        serialQueueSecond.async {
            WorkSimulator().simulateWork(number: 3)
        }
        print("work ended?")
    }
}

struct SerialQueueSyncExample: Executable {

    let serialQueue = DispatchQueue(label: "com.gcd.mySerialQueue", attributes: [])
    
    func execute() {
        serialQueue.sync {
            WorkSimulator().simulateWork()
            print("SyncWork1 done")
        }
        serialQueue.sync {
            WorkSimulator().simulateWork()
            print("SyncWork2 done")
        }
        serialQueue.sync {
            WorkSimulator().simulateWork()
            print("SyncWork3 done")
        }
    }
}
