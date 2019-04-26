//
//  RuntimeTool.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/9/6.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

import Foundation

class Student: Person {
    var identifier:String?
    @objc dynamic let sex = 0
    @objc dynamic var address:String? = "s"
    
    func method1(int:Int) -> () {
    }
    
    @objc dynamic func dynamicMethod() {
    }
}

class RuntimeTool {
    
    //查询成员变量1
    
    class func ivarMirror(cls:Any) -> [String:Any] {
        
        var mirror = Mirror(reflecting: cls)
        var resDic:[String:Any] = [:]
        
        while mirror.children.count != 0 {
            for case let (label?,value) in mirror.children {
                resDic[label] = value
            }
            if let m = mirror.superclassMirror{
                mirror = m
            }
        }
        
        return resDic
    }
    
    //查询成员变量2
    static func checkIvarlist(cls:AnyClass) -> [String] {
        
        var count:UInt32 = 0
        let ivarlist = class_copyIvarList(cls, &count)
        
        return (0 ..< count).compactMap { idx in
            ivarlist.flatMap { ivar_getName($0.advanced(by: Int(idx)).pointee).map({ String(cString: $0) }) }
        }
    }
    
    //查询属性
    static func checkProperties(cls:AnyClass) -> [String] {
        
        var count: UInt32 = 0
        let propertyList = class_copyPropertyList(cls, &count)
        
        return (0 ..< count).compactMap { idx in
            propertyList.map { String(cString: property_getName($0.advanced(by: Int(idx)).pointee)) }
        }
    }
    
    //查询方法
    static func checkMethods(cls:AnyClass) -> [String] {
        
        var count: UInt32 = 0
        let methodList = class_copyMethodList(cls, &count)
        
        return (0..<count).compactMap { idx in
            methodList.map { method_getName($0.advanced(by: Int(idx)).pointee).description }
        }
    }
}
