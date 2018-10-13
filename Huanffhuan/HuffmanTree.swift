//
//  HuffmanTree.swift
//  Huanffhuan
//
//  Created by ChuXiaoMin on 2018/10/13.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

import Foundation

struct HuffmanTree<T> {
    var root: UUID
    var left, right: [UUID : UUID]
    var content: [UUID : T]
    var value: Double
    
    init(single: T, evaluatesTo: Double) {
        root = UUID()
        left = [:]
        right = [:]
        content = [root : single]
        value = evaluatesTo
    }
    
    init(combine a: HuffmanTree<T>, with b: HuffmanTree<T>) {
        root = UUID()
        
        left = [root : a.root]
        left.merge(a.left) {(old, new) in old}
        left.merge(b.left) {(old, new) in old}
        right = [root : b.root]
        right.merge(a.left) {(old, new) in old}
        right.merge(b.left) {(old, new) in old}
        
        content = a.content
        content.merge(b.content) {(old, new) in old}
        
        value = a.value + b.value
    }
}

extension HuffmanTree: TreeLike {
    func leftChild(of term: UUID) -> UUID? {
        return left[term]
    }
    
    func rightChild(of term: UUID) -> UUID? {
        return right[term]
    }
    
    func content(of term: UUID) -> T? {
        return content[term]
    }
}
