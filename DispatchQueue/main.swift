//
//  main.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

let printDebug: Bool = true

// Select the desired multithreading example
Examples.execute(.disGroupBad)

RunLoop.main.run(mode: .default, before: Date(timeIntervalSinceNow: .greatestFiniteMagnitude))
