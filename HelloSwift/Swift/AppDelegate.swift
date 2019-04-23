//
//  AppDelegate.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/8/23.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

import UIKit
import CoreData
import Dispatch

extension Hello {
    private func fileOutPrivateFuncMethod(){}
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //属性
    var name :String? = "s"
    var sBlock:(()->())?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        /*
        //测试SWIT混编OC
        let ocf = OCFile()
        ocf.instanceFunction(.east)
        OCFile.classFunction()
        print("+++\(ocf.anArr)")

        //测试KVC
        let gabrielle = Person(name: "Gabrielle")
        let jim = Person(name: "Jim")
        let yuanyuan = Person(name: "Yuanyuan")
        gabrielle.friends = [jim, yuanyuan]
        gabrielle.bestFriend = yuanyuan
        gabrielle.value(forKey: #keyPath(Person.name))
        gabrielle.value(forKeyPath: #keyPath(Person.bestFriend.name))
        
        //测试KVO
        let people = People()
        people.name = "NewNAME"
        */

        //集合类型初始化
//        var set: Set = Set<Int>()
//        var arr: Array = [AnyObject]()
//        var dic: Dictionary = [Int:Any]()
        
        //测试映射与运行时实现KVC
//        let st = Student(name: "A")
//        
//        let cls = Student.self
//        let metArr = RuntimeTool.checkMethods(cls:cls)
//        let ivarArr = RuntimeTool.checkIvarlist(cls: cls)
//        let propArr = RuntimeTool.checkProperties(cls: cls)
//        let ivarsMirror = RuntimeTool.ivarMirror(cls:st)
//        
//        print(metArr)
//        print(ivarArr)
//        print(propArr)
//        print(ivarsMirror)
        
        
//        let book1 = Book()
//        book1.name = "swift"
//
//        let bookShelf = BooksShelf()
//        bookShelf.book = book1
//
//        print(bookShelf.book === book1)

        //多线程
//        let mult = GCDHelper()
//        mult.callSerialQueue(isSerial: true)
//        mult.callSerialQueue(isSerial: false)
        
        //排序算法
//        var anArr = [5,8,1,4,2,7,6,3]
//        SortUtil.selectSort(sourceArr: &anArr)
//        print(anArr)
//        OCFile.classFunction()
        
        //learnSwift()
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer =
        {
        let container = NSPersistentContainer(name: "HelloSwift")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func learnSwift() -> Void {
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
}

