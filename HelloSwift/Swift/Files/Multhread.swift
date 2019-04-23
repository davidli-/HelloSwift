//
//  Multhread.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/9/15.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

import Foundation

class Multhread {
    
    func callSerialQueue(isSerial:Bool) {
        
        //创建队列
        let queue : DispatchQueue
        var activate : Bool
        let group = DispatchGroup()
        
        if isSerial{//串行队列
            queue = DispatchQueue(label: "defaultSeria", qos: .userInitiated)
            activate = false
        }
        else{//并发队列
            queue = DispatchQueue(label: "concurrent", qos: .userInitiated, attributes: [.concurrent,.initiallyInactive])
            activate = true
        }
        
        /********************************************************************/
        
        //任务1 (DispatchWorkItem创建任务)
        let workItem = DispatchWorkItem{
            for i in 1...5 {
                print("Task1: \(i)")
            }
        }
        
        //执行任务1
        queue.async(group: group) {
            workItem.perform()
            //任务1执行完成后的回调
            workItem.notify(queue: DispatchQueue.main) {
                print("+Task1 Finished+")
            }
        }
        
        /********************************************************************/
        
        //任务2
        queue.async(group: group) {
            for i in 6...10 {
                print("++++Task2: \(i)")
            }
        }
        
        //是否需要手动触发
        if activate {
            queue.activate()
        }
        
        /********************************************************************/
        //组任务完成回调
        group.notify(queue: DispatchQueue.main) {
            
            print("++++Group Finished~")
            
            /********************************************************************/
            
            //延时调用
            let delayQueue = DispatchQueue(label: "test",qos: .userInitiated)
            print("++++Start time: \(Date())")
            delayQueue.asyncAfter(deadline: .now() + 2) {
                print("++++End time: \(Date())")
            }
        }
    }
}
