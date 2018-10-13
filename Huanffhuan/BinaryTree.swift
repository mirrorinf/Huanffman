//
//  BinaryTree.swift
//  Huanffhuan
//
//  Created by ChuXiaoMin on 2018/10/13.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation

struct BinaryTree<T> {
    var root: UUID
    var left: [UUID : UUID]
    var right: [UUID : UUID]
    var content: [UUID : T]
    
    init() {
        left = [:]
        right = [:]
        content = [:]
    }
    
    init(single: T) {
        let rootID = UUID()
        root = rootID
        content = [:]
        content[rootID] = single
        left = [:]
        right = [:]
    }
    
    init(combine a: BinaryTree, with b: BinaryTree) {
        
    }
}
