//
//  DispatchGroup.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

struct DispatchGroupBadExample: Executable {

    let serialQueue = DispatchQueue(label: "com.gcd.mySerialQueue")
    let concurrentQueue = DispatchQueue(label: "com.gcd.myConcurrentQueue", attributes: [.concurrent])

    func execute() {
        var string1 = ""
        var string2 = ""
        var string3 = ""
        
        serialQueue.async {
            print("Doing some work 1...")
            WorkSimulator().simulateWork(time: 1)
            string1 = "Volk"
        }
        
        concurrentQueue.async {
            print("Doing some work 2...")
            WorkSimulator().simulateWork(time: 1.4)
            string2 = "Volkovich"
        }
        
        concurrentQueue.async {
            print("Doing some work 3...")
            WorkSimulator().simulateWork(time: 1.2)
            string3 = "Volkov"
        }
        
        print("All work is done!")
        print("Result is: ", string1, string2, string3)
    }
}

struct DispatchGroupExample: Executable {
    
    let serialQueue = DispatchQueue(label: "com.gcd.mySerialQueue", attributes: [])
    let concurrentQueue = DispatchQueue(label: "com.gcd.myConcurrentQueue", attributes: [.concurrent])
    
    func execute() {
        let group = DispatchGroup()
        var string1 = ""
        var string2 = ""
        var string3 = ""
        
        concurrentQueue.async(group: group, execute: {
            print("Doing some work 1...")
            WorkSimulator().simulateWork(time: 1)
            string1 = "Volk"
        })
        
        concurrentQueue.async(group: group, execute: {
            print("Doing some work 2...")
            WorkSimulator().simulateWork(time: 1.4)
            string2 = "Volkovich"
        })
        
        concurrentQueue.async(group: group, execute: {
            print("Doing some work 3...")
            WorkSimulator().simulateWork(time: 1.2)
            string3 = "Volkov"
        })

        print("Start downloading some pics")

        group.wait()
        print("All work is done!")
        print("Result is: ", [string1, string2, string3].joined(separator: " "))
        print("Some another sync")
    }
}
