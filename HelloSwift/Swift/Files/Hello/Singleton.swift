//
//  Singleton.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/10/20.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import Foundation

// MARK: Swift中声明单例
// 以下三种本质上来说 都用到了静态类属性

// MARK: 方式1: 静态常量
class SingletonClass {
    // 声明类变量 外部通过 SingletonClass.shared 获取单例
    static let shared = SingletonClass()
    // 声明成私有 防止外界通过SingletonClass()创建实例
    private init() {
    }
    func instanceFunc(){
        print("+++call static func~")
    }
}
// 调用单例及其方法
//SingletonClass.shared.instanceFunc()


// MARK: 方式2：内部结构体
class SingletonClass2 {
    static var shared: SingletonClass2 {
        struct SingletonStruct {
            static let shared = SingletonClass2()
        }
        return SingletonStruct.shared
    }
    
    private init() {
    }
    func instanceFunc(){
        print("+++call static func2~")
    }
}
// 调用单例及其方法
//SingletonClass2.shared.instanceFunc()


// MARK: 方法3：全局变量
fileprivate let globalVar = SingletonClass3() //只对当前.swift文件可见 别的文件中创建此单例时看不到此变量

class SingletonClass3 {

    static var shared: SingletonClass3 {
        return globalVar
    }

    fileprivate init() { }
    func instanceFunc(){
        print("+++call static func3~")
    }
}
//SingletonClass3.shared.instanceFunc()
