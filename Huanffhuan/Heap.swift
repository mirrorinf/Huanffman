//
//  Heap.swift
//  Huanffhuan
//
//  Created by ChuXiaoMin on 2018/10/13.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation

protocol Heaplike: TreeLike {
    func interchange(_: Node, with: Node)
    func deleteRoot() -> Stored
    func insert(_: Node, asLeftChildOf: Node)
    func insert(_: Node, asRightChildOf: Node)
    
}


