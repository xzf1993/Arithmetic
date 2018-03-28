//
//  Binary_Tree.h
//  Arithmetic
//
//  Created by brks on 2018/3/28.
//  Copyright © 2018年 borrow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Binary_Tree_Node : NSObject
@end

@interface Binary_Tree : NSObject
@property(nonatomic, strong)Binary_Tree_Node *root_Node;//根节点
- (void)add:(int)item; //添加节点
- (void)breadth_travel; //广度遍历节点
- (void)preOrder:(Binary_Tree_Node *)node; //深度遍历节点 前序遍历
- (void)inOrder:(Binary_Tree_Node *)node; //深度遍历节点 中序遍历
- (void)postOrder:(Binary_Tree_Node *)node; //深度遍历节点 后序遍历
@end
