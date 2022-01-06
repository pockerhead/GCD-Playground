//
//  ThreadSafeArray.swift
//  DispatchQueue
//
//  Created by artem on 22.09.2020.
//

import Foundation

struct ThreadSafeArray<Element>: Appendable, CustomStringConvertible {

    let sem = DispatchSemaphore.init(value: 1)
    private(set) var innerArray: Array<Element> = []

    mutating func append(_ value: Element) {
        sem.wait()
        innerArray.append(value)
        sem.signal()
    }

    var description: String {
        return "\(innerArray)"
    }

}

extension ThreadSafeArray: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Self.ArrayLiteralElement...) {
        innerArray = elements
    }
}

extension ThreadSafeArray: Sequence {
    typealias ArrayLiteralElement = Element
    typealias Element = Element

    func makeIterator() -> Iterator {
        Iterator(innerArray: self)
    }

    subscript(_ index: Int) -> Element? {
        guard index < count else { return nil }
        return innerArray[index]
    }

    struct Iterator: IteratorProtocol {
        var innerArray: ThreadSafeArray<Element>
        var index = 0

        mutating func next() -> Element? {
            let el = innerArray[index]
            index += 1
            return el
        }
    }

    var count: Int {
        innerArray.count
    }

    var isEmpty: Bool {
        innerArray.isEmpty
    }
}
