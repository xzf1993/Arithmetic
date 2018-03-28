//: Playground - noun: a place where people can play

import UIKit

//MARK: 冒泡排序
func bubble_sort(array: [Int]) -> [Int] {
    if array.count == 0 {
        return []
    }
    
    var newArray = array
    for i in 0..<(newArray.count - 1) {
        var count = 0
        
        for j in 0..<(newArray.count - 1 - i) {
            if newArray[j] > newArray[j + 1] {
                let temp = newArray[j]
                newArray[j] = newArray[j + 1]
                newArray[j + 1] = temp
                count += 1
            }
        }
        
        if count == 0 {
            return newArray
        }
    }
    
    return newArray
}

//MARK: 插入排序
func insert_sort(array: [Int]) -> [Int] {
    if array.count == 0 {
        return []
    }
    
    var newArray = array
    
    for i in (1..<newArray.count) {
        for j in (1...i).reversed() {
            if newArray[j - 1] > newArray[j] {
                let temp = newArray[j - 1]
                newArray[j - 1] = newArray[j]
                newArray[j] = temp
            }
        }
    }
    return newArray
}

//MARK: 选择排序
func select_sort(array: [Int]) -> [Int] {
    if array.count == 0 {
        return []
    }
    
    var newArray = array
    
    for i in (0..<newArray.count) {
        var min_index = i
        
        for j in (i + 1)..<newArray.count {
            if newArray[j] < newArray[min_index] {
                min_index = j
            }
        }
        
        let temp = newArray[i]
        newArray[i] = newArray[min_index]
        newArray[min_index] = temp
    }
    
    return newArray
}

//MARK: 快速排序
func quick_sort(array: inout [Int], start: Int, end: Int) -> [Int] {
    if array.count == 0 {
        return []
    }
    
    if start >= end {
        return []
    }
    
    var left = start
    var right = end
    
    let mid_value = array[left]
    while left < right {
        while (left < right && array[right] >= mid_value) {
            right -= 1
        }
        array[left] = array[right]
        
        while (left < right && array[left] < mid_value) {
            left += 1
        }
        array[right] = array[left]
    }
    array[left] = mid_value
    
    quick_sort(array: &array, start: start, end: left - 1)
    quick_sort(array: &array, start: left + 1, end: end)
    return array
}

//MARK: 希尔排序
func shell_sort(array: inout [Int]) -> [Int] {
    if array.count == 0 {
        return []
    }
    
    var T: Int = array.count / 2
    while T > 0 {
        for i in (T..<array.count) {
            var j = i
            
            while j >= T && (array[j - T] > array[j]) {
                let temp = array[j - T]
                array[j - T] = array[j]
                array[j] = temp
                j -= T
            }
        }
        
        T /= 2
    }
    
    return array
}

//MARK: 归并排序
func merge_sort(array: inout [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
    
    let mid = array.count / 2
    var left_array: [Int] = []
    for i in (0..<mid) {
        left_array.append(array[i])
    }
    
    var right_array: [Int] = []
    for i in (mid..<array.count) {
        right_array.append(array[i])
    }
    
    left_array = merge_sort(array: &left_array)
    right_array = merge_sort(array: &right_array)
    
    var result: [Int] = []
    var left_p = 0
    var right_p = 0
    
    while left_p < left_array.count && right_p < right_array.count {
        if left_array[left_p] < right_array[right_p] {
            result.append(left_array[left_p])
            left_p += 1
        } else {
            result.append(right_array[right_p])
            right_p += 1
        }
    }
    
    for i in (left_p..<left_array.count) {
        result.append(left_array[i])
    }
    
    for i in (right_p..<right_array.count) {
        result.append(right_array[i])
    }
    
    return result
}

var array = [2, 1, 99, 100, 3, 70, 12, 33, 22, 15]
print(array)
//let nArray = bubble_sort(array: array)
//let nArray = insert_sort(array: array)
//let nArray = select_sort(array: array)
//let nArray = quick_sort(array: &array, start: 0, end: array.count - 1)
//let nArray = shell_sort(array: &array)
let nArray = merge_sort(array: &array)
print(nArray)







