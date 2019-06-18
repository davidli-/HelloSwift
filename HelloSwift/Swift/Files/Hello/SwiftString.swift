//
//  SwiftString.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/6/13.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import Foundation
import UIKit

class SwiftText {
    
    class func onSwiftText() {
        
        // 字符串的处理
        var x = "ABCDEFGHI"
        var sIndex: String.Index  // 开始
        var eIndex: String.Index  // 结束
        var result: String.SubSequence
        
        // 截取前三个字符串（ABC）
        sIndex = x.startIndex
        eIndex = x.index(x.startIndex, offsetBy: 2)
        result = x[sIndex ... eIndex]
        
        // 获取从第三个字符开始的字符串（CDEFGHI）
        //sIndex = x.index(x.startIndex, offsetBy: 2)
        //eIndex = x.endIndex
        //result = x[sIndex ..< eIndex]
        
        // 获取从字符串倒数第五个字开始 往后数两位的字符（EF）
        //sIndex = x.index(x.startIndex, offsetBy: x.lengthOfBytes(using: .utf8) - 5)
        //eIndex = x.index(sIndex, offsetBy:2)
        //result = x[sIndex ..< eIndex]
        //print(result)
        
        // 插入字符串
        x.insert(contentsOf: "JKL", at: x.endIndex)
        print(x)
        
        // 删除字符
        x.removeSubrange(x.index(x.startIndex, offsetBy: (x.lengthOfBytes(using: .utf8) - 2)) ..< x.endIndex)
        print(x)
        
        // 替换字符串
        print(x.replacingOccurrences(of: "I", with: "X"))
        
        eIndex = x.index(of: "C")!
        print(x.replacingCharacters(in: x.startIndex ... eIndex, with: "TEXT"))
        
        // 富文本
        let attT : NSMutableAttributedString = NSMutableAttributedString(string: "This is attribute text~")
        attT.addAttributes([NSAttributedStringKey.foregroundColor : UIColor.blue], range: NSMakeRange(0, 4))
        print(attT)
    }
}
