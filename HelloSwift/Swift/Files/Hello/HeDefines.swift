//
//  HeDefines.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/4/28.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import Foundation
import UIKit

/**
 *swift中没有宏定义，
 *OC中的宏定义常量，在swift中可以使用常量代替
 *OC中的带参数宏定义，在swift中可以使用函数代替
 */

///不带参数的常量
let kAnimationDuration = 0.5
let kScreen_Width = UIScreen.main.bounds.width

/**
 * # 带参数的函数
 * ## 颜色转换 传入 0-255 之间的数
 - parameter r: 红色（0-255）
 - parameter g: 绿色（0-255）
 - parameter b: 蓝色（0-255）
 - parameter alpha: 透明度 （0-1）
 */
func kColor(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
}


/// 测试环境下打印日志
///
/// - Parameters:
///   - content: 打印的内容
func kPrint<T>(content: T) {
    #if DEBUG
        print("\(content)")
    #endif
}
