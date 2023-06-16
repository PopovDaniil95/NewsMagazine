//
//  Dynamic.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 16.06.2023.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listiner: Listener?
    
    func bind(_ listiner: Listener?) {
        self.listiner = listiner
    }
    
    var value: T {
        didSet {
            listiner?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
