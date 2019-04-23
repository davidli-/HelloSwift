//
//  ViewController.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/8/23.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //属性
    var name :String? = "s"
    var sBlock:(()->())?
    
    @IBOutlet weak var pushBtn: UIButton!
    
    //方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //解决block循环引用
        sBlock = {
            [unowned self] in
            self.name = "x"
        }
        
        //访问extension 测试访问符
        var hello = Hello()
        hello.internalMethod()
        
        
        //访问#类属性# 类似于OC类方法
        print(Hello.storedTypeProperty)
        
        //computed local Variables 局部变量也可以是计算得来
        var strx:String?{
            get{
                return self.name
            }
            set{
                self.name = newValue
            }
        }
        
        //Learn Use String
        var str = "hello world!"
        for index in str.indices {
            print("\(str[index]) ", terminator: "")
        }
        
        //iterate by subscript with [String.Index]
        let s1 = str[str.startIndex] //h
        let s2 = str[str.index(before: str.endIndex)] //!
        let s3 = str[str.index(str.startIndex, offsetBy: 1)] //e
        let s4 = str[str.index(str.index(str.startIndex, offsetBy: 1), offsetBy: 5)] //w
        //iterate by subscript with range
        let s5 = str[str.startIndex...(str.index(str.startIndex, offsetBy: 5))] //hello
        
        print("\n\(s1),\(s2),\(s3),\(s4),\(s5)")
        
        //insert & remove
        str.insert("~", at: str.endIndex) //hello world!~
        print("\(str)")
        let s6 = str.remove(at: str.index(str.startIndex, offsetBy: 11)) //!,hello world~
        print("\(s6),\(str)")
        
        /* ***************  ****************  *************** */
        
        //Learn Array 有序
        var someInts1 = Array<Int>()
        if someInts1.isEmpty
        {
            someInts1 = [1,2,3,4,5] //[1,2,3,4,5]
        }
        someInts1.removeLast() //[1,2,3,4]
        someInts1.remove(at: 3) //[1,2,3]
        someInts1.append(4) //[1,2,3,4]
        
        var someInts2 = [Int]()
        someInts2 = [Int](repeating: 0, count: 1) //[0]
        someInts2[0] = 5 //[5]
        
        var allInts: [Int] = someInts1 + someInts2 //[1,2,3,4,5]
        allInts.insert(0, at: 0) //[0,1,2,3,4,5]
        allInts[0...1] = [1] //[1,2,3,4,5]
        
        for (index,value) in allInts.enumerated() {
            print("Item \(index + 1): \(value)")
        }
        
        /* ***************  ****************  *************** */
        
        //Learn Set 无序
        
        var books: Set = Set<Int>() //A type must be hashable in order to be stored in a se
        books = [0,1,2,3,4,5]
        books.insert(6)
        if books.contains(0)
        {
            books.remove(0)
        }
        
        
        /* ***************  ****************  *************** */
        
        //Learn Dictionary (key Hashable)
        var map = [Int: String]()
        map = [1:"one",2:"two",3:"three"]
        map[4] = "four"
        map.updateValue("five", forKey: 5)
        map.removeValue(forKey: 5)
        
        for (key,value) in map {
            print("key:\(key),value:\(value)")
        }
        
        let allKeys = map.keys
        let allValue = map.values
       
        /* ***************  ****************  *************** */
        //Control flow 可以给 if while for switch等控制流起名字
        aNameOfForLoop: for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        //while 给while循环起名字
        var num = 0
        aNameOfWhileLoop: while num < 5 {
            num += 1
        }
        
        //switch 可匹配文字，不需要break关键字
        let someCharacter: Character = "z"
        AFASF: switch someCharacter {
        case "a","A":
            print("The first letter of the alphabet")
        case "z":
            print("The last letter of the alphabet")
        default:
            print("Some other character")
        }
        
        //匹配范围
        let approximateCount = 62
        let countedThings = "moons orbiting Saturn"
        let naturalCount: String
        switch approximateCount {
        case 1..<5:
            naturalCount = "a few"
        case 5..<12:
            naturalCount = "several"
        case 12..<100:
            naturalCount = "dozens of"
        default:
            naturalCount = "many"
        }
        
        //guard 条件语句，相当于if，不同点在于guard后面总是跟着else处理异常并return；条件满足，则继续执行{}之后的代码
        guard 0 < 1 else {
            print("条件不满足~")
            return
        }
        print("条件满足~")
        
        
        /* ***************  ****************  *************** */
        
        //Learn closure/Block
        
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            func incrementer() -> Int {
                runningTotal += amount
                print("++\(runningTotal)")
                return runningTotal
            }
            return incrementer
        }
        
        let incrementByTen = makeIncrementer(forIncrement: 10)
        let _ = incrementByTen() // returns a value of 10
        let _ = incrementByTen() // returns a value of 20
        
        
        //Escape closure 逃逸闭包
        var completionHandlers: [() -> Void] = []
        func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
            completionHandlers.append(completionHandler)
        }
        someFunctionWithEscapingClosure {
            print("escape closure is called~")
        }
        let aHandler = completionHandlers[0]
        aHandler() //调用闭包
    }
    
    deinit{
        print("++ deinited !")
    }
    
    @IBAction func onAction(_ sender: Any) {
        let board = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = board.instantiateViewController(withIdentifier: "v")
        let valueR = CGFloat(arc4random() % 10) / 10.0;
        let valueG = CGFloat(arc4random() % 10) / 10.0;
        let valueB = CGFloat(arc4random() % 10) / 10.0;
        viewController.view.backgroundColor = UIColor.init(red: valueR, green: valueG, blue: valueB, alpha: 1)
        present(viewController,animated: true,completion: nil)
    }
    
    @IBAction func onDismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

