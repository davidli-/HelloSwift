//
//  Closure.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/10/20.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import Foundation

// MARK: 一般闭包
struct HekonClosure {
    // 别名
    typealias aBlock = ()->()
    
    func callClosure() {
        // 最简单的形式
        let closure: ()->Void = { ()->Void in
            print("++call closure~")
        }
        closure()
        
        // 带参数和返回值
        let closure2 = { (a:Int,b:Int)->Int in
            print("+++a+b=\(a+b)")
            return a+b
        }
        closure2(1,2)

        // 优化:在已知参数类型、返回值类型的情况下，可省略参数和返回值，以及return关键字
        let closure3: (Int,Int)->Int = { $0 + $1 }
        print("+++1+3=\(closure3(1,3))")
        
        // 尾随闭包：闭包作为函数的最后一个参数
        func fwithClosure(a:Int, closure4:(Int)->Int) {
            closure4(1) //调用闭包
        }
        //调用函数1
        fwithClosure(a: 1, closure4: { (a:Int) -> Int in
            print("+++call block:\(a+1)")
            return a+1
        })
        
        //调用函数2 使用尾随闭包
        fwithClosure(a: 1) { (a:Int) -> Int in
            print("+++call block:\(a+1)")
            return a+1
        }
    }
}


// MARK: 逃逸闭包
class NetHelper {
    
    var statusOK = false
    
    // 逃逸闭包
    func httpRequest(withUrl url:String,
                     succeesCallback: @escaping (Data?,URLResponse?)->(),
                     failCallback: @escaping (Error?)->()) {
        //逃逸闭包必须用@escaping声明;
        //否则编译时报错 Escaping closure captures non-escaping parameter 'succeesCallback'
        guard !url.isEmpty else{
            print("+++URL is nil~")
            return
        }
        print("++task start")
        let urlT:URL? = URL(string: url)
        let task = URLSession.shared.dataTask(with: urlT!) {(data:Data?, response:URLResponse?, error:Error?) in
            if error != nil {
                self.statusOK = false // 逃逸闭包中使用到闭包所在类型时 需要显式的调用self 以便提醒自己捕获了self, 不写编译器会报错!
                failCallback(error) //调用逃逸闭包
            }else{
                self.statusOK = true
                succeesCallback(data,response) //调用逃逸闭包
            }
        }
        task.resume() // 开始任务
    }
}

/* 调试
var netHelper = NetHelper()
netHelper.httpRequest(withUrl: "https://www.baidu.com", succeesCallback: { (data, response) in
    print("+++Network finished successfully~\n response:\(response!)")
}) { (error) in
    print("++++error:\(error!)")
}*/



// MARK:自动闭包
// 非自动闭包
func nonAutoClosure(closure: ()->Int, a:Int){
    let result = closure()
    print("+++result is:\(result)")
}
// 调用非自动闭包
//nonAutoClosure(closure: { 1+1 }, a: 1)  // 这时表达式两边还需要带上{}


// 自动闭包
func autoClosure(closure: @autoclosure ()->Int, a:Int){
    //Argument type of @autoclosure parameter must be '()'
    //闭包的参数列表须为空，即()->Type，不能是(Int)->Int这种
    let result = closure()
    print("+++result is:\(result)")
}
// 调用自动闭包
//autoClosure(closure: 1+1, a: 1) // 这时表达式两边就不再需要带{}了
