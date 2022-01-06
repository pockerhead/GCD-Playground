//
//  Appendable.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

protocol Appendable {
    associatedtype Element
    mutating func append(_ value: Element)
}

extension Array: Appendable {
}

extension Set: Appendable where Element: Comparable {
    mutating func append(_ value: Element) {
        insert(value)
    }
}
