//
//  Pattern_kvo.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/8/29.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

import UIKit

/// KVO示例
class People: NSObject {
    
    //定义待监听的属性
    @objc dynamic var name = "defaultName"
    
    //更新属性值
    func updateName(pName:String) -> () {
        name = pName
    }
    
    //注册监听
    override init() {
        super.init()
        addObserver(self, forKeyPath: "name", options: [.new,.old], context: nil)
    }
    
    //处理监听
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        
        if keyPath == "name", let newName = change?[.newKey] {
            print("++++name updated to: \(newName)")
        }else{
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    //析构中移除监听
    deinit {
        removeObserver(self, forKeyPath: "name", context: nil)
        print("++++已移除监听")
    }
}


//通过自定义监听器来监听属性变化
class Observer: NSObject {
    
    @objc var objToObserve : People
    
    var observation : NSKeyValueObservation?
    
    //注册监听
    init(object : People) {
        objToObserve = object
        super.init()
        
        observation = observe(\.objToObserve.name,options: [.old, .new], changeHandler: { (object, change) in
            print("++++name updated from: \(change.oldValue!), updated to: \(change.newValue!)")
        })
    }
    
    deinit {
        print("++++Observer Deinited")
    }
}





// KVC示例
class Person: NSObject {
    @objc var name: String
    @objc var friends: [Person] = []
    @objc var bestFriend: Person? = nil
    
    init(name: String) {
        self.name = name
    }
}

