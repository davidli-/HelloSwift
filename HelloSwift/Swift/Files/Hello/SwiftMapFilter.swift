//
//  SwiftMapFilter.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/6/13.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import Foundation

class SwiftMapFilter {
    
    static func onMapFilter() {
        //dic.map
        let dic = ["a":1,"b":2,"c":3]
        let s1Arr = dic.map { (element) -> String in
            let (key, value) = element
            return key + "\(value)"
        }
        let s2Arr = dic.map { $0 + "\($1)"}
        print(s1Arr)
        print(s2Arr)
        
        //arr.map 返回结果中可以带有nil
        let values = ["1","2","3","4","5","End"]
        let result1 = values.map { Int($0) } //将数组中的字符转换为对应的数值并重新组合成一个新数组
        
        //flatmap 返回结果中不含nil，自动拆包，且会对二维数组降维
        let result2 = values.compactMap { (Int($0) ?? 0) + 1} //将数组中的字符串转换成数值+1并组成新数组
        
        //filter
        let result3 = values.filter { $0.lengthOfBytes(using: .utf8) < 2} //过滤掉长度大于2的字符串
        
        //reduce
        let initialResult = "Start"
        let result4 = values.reduce(initialResult) { (tmp, element) -> String in
            return tmp + "-" + element
        }
        
        // 组合链式调用
        let result5 = (values.map {Int($0) ?? 0 }).filter { $0 >= 3}
        
        print(result1)
        print(result2)
        print(result3)
        print(result4)
        print(result5)
    }
}
