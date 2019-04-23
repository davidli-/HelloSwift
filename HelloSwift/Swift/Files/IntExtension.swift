//
//  IntExtension.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/8/24.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

import Foundation

extension Int {
    
    //++a
    static prefix func ++(num : inout Int) -> Int
    {
        num += 1
        return num
    }
    
    //a++
    static postfix func ++(num : inout Int) -> Int
    {
        let tmp = num
        num += 1
        return tmp
    }
    
    //--a
    static prefix  func --(num:inout Int) -> Int
    {
        num -= 1
        return num
    }
    
    //a--
    static postfix  func --(num:inout Int) -> Int
    {
        let temp = num
        num -= 1
        return temp
    }
}
