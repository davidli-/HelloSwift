//
//  Dispatch.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/9/5.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

import Foundation

protocol Eat {
    func eat()  //动态派发
}

extension Eat {
    func eat() {//动态派发
        print("eat()协议方法的默认实现")
    }
    func drink() {//静态派发
    }
}

class Sheep: Eat {
    func eat() {//动态派发
        print("eat的实现")
    }
    func drink() {//动态派发
        print("dink的实现")
    }
    @objc func run() {} //动态派发
}

extension Sheep {
    func jump() {} //静态派发
    @objc func sleep() {} //动态派发
}

enum DiceNumber : Int {
    case one = 1
    case two
    case three
    case four
    case five
    case six
    
    mutating func updateDirection(num:DiceNumber) {//静态派发
        self = num
    }
}

struct Dice {
    var slides = 6
    func random(dice: DiceNumber) -> Int {//静态派发
        return dice.rawValue
    }
}
