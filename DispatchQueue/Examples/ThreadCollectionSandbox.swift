//
//  ThreadCollectionSandbox.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

struct ThreadCollectionSanbox: Executable {

    let concurrentQueue = DispatchQueue(label: "com.gcd.myConcurrentQueue", attributes: [.concurrent])

    func execute() {
        
    }
}
