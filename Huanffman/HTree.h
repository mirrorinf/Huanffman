//
//  HTree.h
//  Huanffman
//
//  Created by ChuXiaoMin on 2018/10/12.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

#ifndef BTree_h
#define BTree_h

typedef struct _HTreeNode {
    void *managed;
    struct _HTreeNode *left, *right;
} HTreeNode;

typedef struct _HTree {
    HTreeNode *root;
    double value;
} HTree;

HTree *createHTree(void *managed, double value);
HTree *mergeAndDestroyHTree(HTree *left, HTree *right);
HTree *buildHTree(void **managed, double *valueEach, int count);
void *destroySingleNodeHTree(HTree *target);

#endif /* BTree_h */
