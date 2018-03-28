//
//  ViewController.m
//  Arithmetic
//
//  Created by brks on 2018/3/27.
//  Copyright © 2018年 borrow. All rights reserved.
//

#import "ViewController.h"
#import "Binary_Tree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSMutableArray <NSNumber *>*array = [NSMutableArray arrayWithArray: @[@(2), @(7), @(3), @(1), @(22), @(4), @(6), @(99), @(45), @(17), @(33)]];
//    NSLog(@"%@", array);
    
//    NSArray *nArray = [self bubble_sort:array];
//    NSArray *nArray = [self insert_sort:array];
//    NSArray *nArray = [self select_sort:array];
//    NSArray *nArray = [self shell_sort:array];
//    NSArray *nArray = [self merge_sort:array];
//    NSArray *nArray = [self quick_sort:array startIndex:0 endIndex:@(array.count - 1).intValue];
//    NSLog(@"%@", nArray);
    
    
    
    //二叉树
    Binary_Tree *tree = [[Binary_Tree alloc] init];
    [tree add:0];
    [tree add:1];
    [tree add:2];
    [tree add:3];
    [tree add:4];
    [tree add:5];
    [tree add:6];
    [tree add:7];
    [tree add:8];
    [tree add:9];
     
//    [tree breadth_travel];
//    [tree preOrder:tree.root_Node];
//    [tree inOrder:tree.root_Node];
    [tree postOrder:tree.root_Node];
}

#pragma mark - 冒泡排序
/**
 冒泡排序

 @param array 排序前的数组
 @return 排序后的数组
 */
- (NSArray *)bubble_sort:(NSMutableArray <NSNumber *>*)array {
    if (array.count == 0) {
        return @[];
    }
    
    for (int i = 0; i < array.count - 1; i ++) {
        int count = 0;
        for (int j = 0; j < array.count - 1 - i; j ++) {
            if (array[j].intValue > array[j + 1].intValue) {
                NSNumber *temp = array[j];
                [array replaceObjectAtIndex:j withObject:array[j + 1]];
                [array replaceObjectAtIndex:(j + 1) withObject:temp];
                
                count ++;
            }
        }
        
        if (count == 0) {
            return array;
        }
    }
    return array;
}

#pragma mark - 插入排序
/**
 插入排序

 @param array 排序前的数组
 @return 排序后的数组
 */
- (NSArray *)insert_sort:(NSMutableArray <NSNumber *>*)array {
    if (array.count == 0) {
        return @[];
    }
    
    for (int i = 1; i < array.count; i ++) {
        for (int j = i; j > 0; j --) {
            if (array[j - 1].intValue > array [j].intValue) {
                NSNumber *temp = array[j - 1];
                [array replaceObjectAtIndex:j - 1 withObject:array[j]];
                [array replaceObjectAtIndex:j withObject:temp];
            }
        }
    }
    return array;
}

#pragma mark - 快速排序
/**
 快速选择

 @param array 快排之前的数组
 @param start 开始的下标
 @param end 结束的下标
 @return 排序后的数组
 */
- (NSArray *)quick_sort:(NSMutableArray <NSNumber *>*)array startIndex:(int)start endIndex:(int)end {
    if (start >= end) {
        return array;
    }
    
    int left = start;
    int right = end;
    
    NSNumber *temp = array[left];
    while (left < right) {
        while (left < right && array[right].intValue >= temp.intValue) {
            right --;
        }
        array[left] = array[right];
        
        while (left < right && array[left].intValue < temp.intValue) {
            left ++;
        }
        array[right] = array[left];
    }
    array[left] = temp;
    
    [self quick_sort:array startIndex:0 endIndex:left - 1];
    [self quick_sort:array startIndex:left + 1 endIndex:end];
    
    return array;
}

#pragma mark - 选择排序
/**
 选择排序

 @param array 排序前的数组
 @return 排序后的数组
 */
- (NSArray *)select_sort:(NSMutableArray <NSNumber *>*)array {
    if (array.count == 0) {
        return array;
    }
    
    for (int i = 0; i < array.count; i ++) {
        int mix_index = i;
        for (int j = i + 1; j < array.count; j ++) {
            if (array[j].intValue < array[mix_index].intValue) {
                mix_index = j;
            }
        }
        NSNumber *temp = array[i];
        [array replaceObjectAtIndex:i withObject:array[mix_index]];
        [array replaceObjectAtIndex:mix_index withObject:temp];
    }
    
    return array;
}

#pragma mark - 希尔排序
/**
 希尔排序

 @param array 排序前的数组
 @return 排序后的数组
 */
- (NSArray *)shell_sort:(NSMutableArray <NSNumber *>*)array {
    if (array.count == 0) {
        return array;
    }
    
    int T = @(array.count / 2).intValue;
    while (T) {
        for (int i = T; i < array.count; i ++) {
            int j = i;
            while (j >= T && array[j - T].intValue > array[j].intValue) {
                NSNumber *temp = array[j - T];
                [array replaceObjectAtIndex:j - T withObject:array[j]];
                [array replaceObjectAtIndex:j withObject:temp];
                j -= T;
            }
        }
        
        T /= 2;
    }
    
    return array;
}

#pragma mark - 归并排序
/**
 归并排序

 @param array 排序前的数组
 @return 排序后的数组
 */
- (NSMutableArray <NSNumber *>*)merge_sort:(NSMutableArray <NSNumber *>*)array {
    if (array.count <= 1) {
        return array;
    }
    
    int mid_index = @(array.count / 2).intValue;
    NSMutableArray <NSNumber *>*left_array = [NSMutableArray array];
    NSMutableArray <NSNumber *>*right_array = [NSMutableArray array];
    
    for (int i = 0; i < mid_index; i ++) {
        [left_array addObject:array[i]];
    }
    
    for (int i = mid_index; i < array.count; i ++) {
        [right_array addObject:array[i]];
    }
    
    left_array = [self merge_sort:left_array];
    right_array = [self merge_sort:right_array];
    
    NSMutableArray <NSNumber *>*result = [NSMutableArray array];
    int left_index = 0;
    int right_index = 0;
    
    while (left_index < left_array.count && right_index < right_array.count) {
        if (left_array[left_index].intValue > right_array[right_index].intValue) {
            [result addObject:right_array[right_index]];
            right_index ++;
        } else {
            [result addObject:left_array[left_index]];
            left_index ++;
        }
    }
    
    for (int i = left_index; i < left_array.count; i ++) {
        [result addObject:left_array[i]];
    }
    
    for (int i = right_index; i < right_array.count; i ++) {
        [result addObject:right_array[i]];
    }
    
    return result;
}

@end




