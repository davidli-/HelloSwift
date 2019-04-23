//
//  Hello.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/8/23.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

import Foundation

//protocol
protocol A {
    var aVar : Int {get}
}
//inherit from protocol
protocol B : A {
    var bVar : Int {get set}
}

//class apply protocols
class Hello: B {
    
    //1.实现协议
    var aVar: Int
    var bVar: Int
    
    //2.声明类变量
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
    
    //3.methods 允许同名不同参
    func aFuncName(x:Int) {
        internalMethod()
        filePrivateMethod()
        privateMethod() //同文件中的扩展中定义的 pirvate扩展方法在本类中也能使用
    }
    func aFuncName(x:String) {
        //fileOutPrivateFuncMethod() //报错，不同文件的扩展中定义的 private 扩展方法在本类中不能使用
    }
    
    //4.初始化全部属性
    init() {
        aVar = 0
        bVar = 1
    }
}

//Extension
extension Hello {
    
    //var storeVar : Int //扩展中不能声明存储属性
    var computeVar : Int{
        return 8
    }
    /*swift的扩展中不能重写原类中的方法
    func aFuncName(x:Int) {
    }
    */
    
    internal func internalMethod(){}
    fileprivate func filePrivateMethod(){}
    private func privateMethod(){}
}


var GlobleVarable:String = "G"
var computVar: Int {
    get{
        return 0
    }
    set{
    }
}


//访问符示例
class Animal {
    //默认internal
    
    var name: String? {
        willSet{
            if let n = newValue {//可选绑定
                print(n)
            }
        }
        didSet{
            print(oldValue as Any)
        }
    }
    
    // fileprivate 可在当前.swift文件内所有类中访问
    fileprivate var filePrivateProp = "File Private Property"
    fileprivate func filePrivateMethod() {}
    
    // private 仅可在本类或扩展中访问
    private var privateProp = "Private Property"
    private func privateMethod() {}
    
    func funcName<G>(param:  G) -> () {
        print(GlobleVarable)
    }
}

//实现 Equatable 协议
class Cat: Animal,Equatable {
    
    func test() {
        filePrivateMethod()
        print("\(filePrivateProp)")
    }
    
    fileprivate override func filePrivateMethod() {}
    
    //重写 ==方法
    static func ==(lhs:Cat, rhs:Cat) -> Bool {
        if lhs.name == rhs.name{
            return true
        }else{
            return false
        }
    }
}

//实现复制协议
class Book: NSCopying
{
    var name: String?
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Book()
        copy.name = name
        return copy
    }
}

class BooksShelf {
    @NSCopying var book: Book?
}


