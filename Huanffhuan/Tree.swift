//
//  Tree.swift
//  Huanffhuan
//
//  Created by ChuXiaoMin on 2018/10/13.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation

protocol TreeLike {
    associatedtype Node
    associatedtype Stored
    var root: Node { get }
    func leftChild(of: Node) -> Node?
    func rightChild(of: Node) -> Node?
    func content(of: Node) -> Stored?
}

protocol Environment {
    associatedtype Element
    func process(_: Element)
}

fileprivate class Serializer<T> {
    var serialized: [T] = []
}

extension Serializer: Environment {
    func process(_ x: T) {
        serialized.append(x)
    }
}

extension TreeLike {
    fileprivate func __preOrdered<T: Environment>(context: T, node n: Node?) where T.Element == Self.Stored {
        guard let current = n else {
            return
        }
        if let stored = self.content(of: current) {
            context.process(stored)
        }
        __preOrdered(context: context, node: self.leftChild(of: current))
        __preOrdered(context: context, node: self.rightChild(of: current))
    }
    
    func preOrdered<T: Environment>(on context: T) where T.Element == Self.Stored {
        __preOrdered(context: context, node: self.root)
    }
    
    func preOrderSerialize() -> [Self.Stored] {
        let s = Serializer<Self.Stored>()
        preOrdered(on: s)
        return s.serialized
    }
}
