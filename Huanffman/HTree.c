//
//  HTree.c
//  Huanffman
//
//  Created by ChuXiaoMin on 2018/10/12.
//  Copyright © 2018 ChuXiaoMin. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "HTree.h"

HTree *createHTree(void *managed, double value) {
    HTree *self;
    HTreeNode *new;
    
    self = malloc(sizeof(HTree));
    new = malloc(sizeof(HTreeNode));
    
    new->managed = managed;
    new->left = NULL;
    new->right = NULL;
    
    self->root = new;
    self->value = value;
    
    return self;
}

void *destroySingleNodeHTree(HTree *target) {
    void *rst = target->root->managed;
    free(target->root);
    free(target);
    return rst;
}

HTree *mergeAndDestroyHTree(HTree *left, HTree *right) {
    HTree *self;
    HTreeNode *new;
    
    self = malloc(sizeof(HTree));
    new = malloc(sizeof(HTreeNode));
    
    new->left = left->root;
    new->right = right->root;
    
    self->root = new;
    self->value = left->value + right->value;
    
    free(left);
    free(right);
    
    return self;
}

HTree *buildHTree(void **managed, double *valueEach, int count) {
    int i, j, k, total, u, v;
    HTree **work, **twork;
    HTree *temp;
    
    if (count < 1) {
        fprintf(stderr, "No element\n");
        return NULL;
    }
    
    work = malloc(sizeof(HTree*) * count);
    twork = malloc(sizeof(HTree*) * count);
    total = count;
    
    for (i = 0; i < count; i++) {
        work[i] = createHTree(managed[i], valueEach[i]);
    }
    
    while (total > 1) {
        i = j = 0;
        for (k = 1; k < total; k++) {
            if (work[k]->value < work[i]->value) {
                i = k;
            }
        }
        for (k = 1; k < total; k++) {
            if (i == 0) {
                j = 1;
            }
            if (work[k]->value < work[j]->value && k != i) {
                j = k;
            }
        }
        
        u = i < j ? i : j;
        v = i < j ? j : i;
        
        temp = mergeAndDestroyHTree(work[i], work[j]);
        work[u] = temp;
        
        total--;
        memcpy(twork, &work[v + 1], sizeof(HTree *)*(total - v));
        memcpy(&work[v], twork, sizeof(HTree *)*(total - v));
    }
    
    temp = work[0];
    free(work);
    free(twork);
    return temp;
}
