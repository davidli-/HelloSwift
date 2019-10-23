//
//  Operation.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/10/23.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import Foundation

class OperationHelper {
    func testOperation() {
        // Swift中不支持NSInvocationOperation，因为它是基于target:selector的，不安全
        let blockOp = BlockOperation {
            print("++BlockOperation 原始任务:\(Thread.current)")
        }

        // 任务优先级
        blockOp.queuePriority = .veryHigh

        // operation在不加入queue的情况下在新线程执行
        // blockOp.addExecutionBlock {
        //     print("+++addExecutionBlock1:\(Thread.current)")
        //}
        // blockOp.addExecutionBlock {
        //     print("+++addExecutionBlock2:\(Thread.current)")
        //}
        // blockOp.start() // 没加入到queue，只能手动开始

        // 队列
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3
        //queue.addOperation(blockOp)

        // 依赖关系
        let op2 = BlockOperation {
            print("++BlockOperation2:\(Thread.current)")
        }
        let op3 = BlockOperation {
            print("++BlockOperation3:\(Thread.current)")
        }
        op3.addDependency(op2)
        op2.addDependency(blockOp)
        queue.addOperations([blockOp,op2,op3], waitUntilFinished: false)
    }
}


// 自定义Operation
class CustomedOperation: Operation {

    var dataTask: URLSessionDataTask?
    
    // 私有属性 维护状态
    private var _isExecuting: Bool = false {
        willSet { willChangeValue(forKey: "isExecuting") }
        didSet { didChangeValue(forKey: "isExecuting") }
    }
    private var _isFinished: Bool = true {
        willSet { willChangeValue(forKey: "isFinished") }
        didSet { didChangeValue(forKey: "isFinished") }
    }
    
    // 重写Operation本来的状态属性
    override var isFinished: Bool{
        return _isFinished
    }
    override var isExecuting: Bool {
        return _isExecuting
    }
    override var isAsynchronous: Bool{
        return true
    }
    
    // 重写start方法
    override func start() {
        guard !isCancelled else {
            _isFinished = true
            return
        }
        _isExecuting = true
        
        // 网络任务 也可以将这一段放到重写的main()中
        let netOpration = BlockOperation { //可以不要这个Operation 因为URLSession默认开启新线程执行任务
            self.dataTask = URLSession.shared.dataTask(with: URL(string: "https://www.BAIDU.com")!) { (data:Data?, response:URLResponse?, error:Error?) in
                DispatchQueue.main.async {
                    self._isExecuting = false
                    self._isFinished = true
                    
                    //callback(data,response,error)
                }
            }
            self.dataTask!.resume();
        }
        OperationQueue().addOperation(netOpration)
    }
    
    // 重写cancel
    override func cancel() {
        super.cancel()
        guard _isExecuting else {
            return
        }
        if _isExecuting {
            _isExecuting = false
            _isFinished = true
        }
        dataTask!.cancel()
    }
}

