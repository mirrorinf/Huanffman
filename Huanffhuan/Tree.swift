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

extension TreeLike {
    func po() {
        
    }
}
