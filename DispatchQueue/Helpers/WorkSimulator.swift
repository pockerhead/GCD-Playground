//
//  WorkSimulator.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

struct WorkSimulator {

    @discardableResult
    func simulateWork(number: Int? = nil, time: TimeInterval? = nil) -> String {
        var timeInterval: TimeInterval
        if let t = time {
            timeInterval = t
        } else {
            timeInterval = max(1, min(1.8, TimeInterval(arc4random_uniform(20))/10))
        }
        let str1 = "Do \(number == nil ? "some" : "\(number!)") work for \(timeInterval)s..."
        printDebug ? print(str1) : ()
        Thread.sleep(forTimeInterval: timeInterval)
        printDebug ? print("Work \(number == nil ? "" : "\(number!)") is done") : ()
        return ""
    }
}
