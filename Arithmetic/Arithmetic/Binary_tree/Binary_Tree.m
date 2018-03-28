//
//  Binary_Tree.m
//  Arithmetic
//
//  Created by brks on 2018/3/28.
//  Copyright © 2018年 borrow. All rights reserved.
//

#import "Binary_Tree.h"

#pragma mark - 二叉树节点
@interface Binary_Tree_Node()
@property(nonatomic, assign) int elem;
@property(nonatomic, strong) Binary_Tree_Node *lChild;
@property(nonatomic, strong) Binary_Tree_Node *rChild;
- (instancetype)initWithItem:(int)item;
@end

@implementation Binary_Tree_Node
/**
 初始化节点
 
 @param item 节点的值
 @return 返回节点
 */
- (instancetype)initWithItem:(int)item {
    if (self = [super init]) {
        self.elem = item;
        self.lChild = nil;
        self.rChild = nil;
    }
    
    return self;
}
@end

#pragma mark - 二叉树
@interface Binary_Tree()

@end

@implementation Binary_Tree
- (instancetype)init {
    if (self = [super init]) {
        self.root_Node = nil;
    }
    
    return self;
}

#pragma mark - 添加节点
/**
 添加节点

 @param item 节点的值
 */
- (void)add:(int)item {
    Binary_Tree_Node *node = [[Binary_Tree_Node alloc] initWithItem:item];
    
    if (self.root_Node == nil) {
        self.root_Node = node;
        return;
    }
    
    NSMutableArray <Binary_Tree_Node *>*nodeArray = [NSMutableArray array];
    [nodeArray addObject:self.root_Node];
    
    while (nodeArray.count) {
        Binary_Tree_Node *cur_node = nodeArray[0];
        
        if (cur_node.lChild == nil) {
            cur_node.lChild = node;
            return;
        } else {
            [nodeArray addObject:cur_node.lChild];
        }
        
        if (cur_node.rChild == nil) {
            cur_node.rChild = node;
            return;
        } else {
            [nodeArray addObject:cur_node.rChild];
        }
        
        [nodeArray removeObjectAtIndex:0];
    }
}

#pragma mark - 广度遍历
/**
 遍历二叉树的每一个节点
 */
- (void)breadth_travel {
    if (self.root_Node == nil) {
        return;
    }
    
    NSMutableArray <Binary_Tree_Node *>*nodeArray = [NSMutableArray array];
    [nodeArray addObject:self.root_Node];
    
    while (nodeArray.count) {
        Binary_Tree_Node *cur_node = nodeArray[0];
        NSLog(@"%d", cur_node.elem);
        
        if (cur_node.lChild != nil) {
            [nodeArray addObject:cur_node.lChild];
        }
        
        if (cur_node.rChild != nil) {
            [nodeArray addObject:cur_node.rChild];
        }
        
        [nodeArray removeObjectAtIndex:0];
    }
}

#pragma mark - 深度遍历
#pragma mark 1.前序遍历 根节点->左子树->右子树
/**
 前序遍历 根节点->左子树->右子树

 @param node 传进来的节点
 */
- (void)preOrder:(Binary_Tree_Node *)node {
    if (node == nil) {
        return;
    }
    
    NSLog(@"%d", node.elem);
    [self preOrder:node.lChild];
    [self preOrder:node.rChild];
}

#pragma mark 2.中序遍历 左子树->根节点->右子树
/**
 中序遍历 左子树->根节点->右子树

 @param node 传进来的节点
 */
- (void)inOrder:(Binary_Tree_Node *)node {
    if (node == nil) {
        return;
    }
    
    [self inOrder:node.lChild];
    NSLog(@"%d", node.elem);
    [self inOrder:node.rChild];
}

#pragma mark 3.前序遍历 左子树->右子树->根节点
/**
 左子树->右子树->根节点

 @param node 传进来的节点
 */
- (void)postOrder:(Binary_Tree_Node *)node {
    if (node == nil) {
        return;
    }
    
    [self postOrder:node.lChild];
    [self postOrder:node.rChild];
    NSLog(@"%d", node.elem);
}
@end






















