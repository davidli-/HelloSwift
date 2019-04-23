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
//        let mult = Multhread()
//        mult.callSerialQueue(isSerial: true)
//        mult.callSerialQueue(isSerial: false)
        
        //排序算法
//        var anArr = [5,8,1,4,2,7,6,3]
//        SortUtil.selectSort(sourceArr: &anArr)
//        print(anArr)
//        OCFile.classFunction()
        let hello = Hello()
        hello.internalMethod()
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

}

