//
//  main.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

let printDebug: Bool = true

Examples.execute(.disGroupBad)

RunLoop.main.run(mode: .default, before: Date(timeIntervalSinceNow: .greatestFiniteMagnitude))
