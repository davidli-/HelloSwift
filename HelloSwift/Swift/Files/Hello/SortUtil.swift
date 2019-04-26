//
//  Algorithm.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/10/8.
//  Copyright © 2018 Macmafia. All rights reserved.
//

import Foundation

class SortUtil {
    
    
    /// 冒泡排序
    ///
    /// - Parameter array: 需要排序的数组
    class func bubleSort(sourceArr array: inout [Int]) -> Void
    {
        let n = array.count
        
        for i in 0 ..< n - 1 {
            for j in 0 ..< (n - i - 1) {
                if array[j] > array[j+1]
                {
                    //arr.swapAt(j, j+1)
                    let tmp = array[j]
                    array[j] = array[j+1]
                    array[j+1] = tmp
                }
            }
        }
    }
    
    
    /// 鸡尾酒排序
    ///
    /// - Parameter array: 待排序数组
    class func cocktailSort(sourceArr array: inout [Int]) -> Void
    {
        let n = array.count
        var left = 0
        var right = n - 1
        
        while left < right {
            
            //前半轮 将最大元素移到最后
            for i in left ..< right {
                if array[i] > array[i+1]{
                    array.swapAt(i, i+1)
                }
            }
            right -= 1
            
            //后半轮 将最小元素移到最前
            if left < right {
                for i in (left+1 ... right).reversed() {//从后向前遍历
                    if array[i-1] > array[i]{
                        array.swapAt(i-1, i)
                    }
                }
                left += 1
            }
        }
    }
    
    
    /// 选择排序
    ///
    /// - Parameter array: 待d排序数组
    class func selectSort(sourceArr array: inout [Int]) -> Void
    {
        let n = array.count
        
        for i in 0 ..< n-1 {// i为已排序序列的末尾
            var min = i
            for j in i+1 ..< n {// 未排序序列
                if array[j] < array[min] {// 找出未排序序列中的最小值
                    min = j
                }
            }
            if min != i {
                array.swapAt(min, i)// 放到已排序序列的末尾，该操作很有可能把稳定性打乱，所以选择排序是不稳定的排序算法
            }
        }
    }
}
