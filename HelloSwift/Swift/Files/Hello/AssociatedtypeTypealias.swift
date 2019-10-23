//
//  AssociatedtypeTypealias.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/6/19.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import Foundation

// typealias给一个类型重新命名
typealias CallBack = (_ a: Int, _ b: Int) -> Int

// associatedtype用在协议中 作为一种对泛型的支持
struct Movie {
    var name: String
}
struct Song {
    var name: String
}

protocol PlayMediaItems {
    associatedtype T // 预留的类型占位符(泛型)
    func playMedia(_ media: T)
}

class Musician: PlayMediaItems {
    typealias T = Song // 指定 T 为 Song 类型
    func playMedia(_ media: Musician.T) { // Musician.T = Song
    }
}
class FilmMaker: PlayMediaItems {
    typealias T = Movie // 指定 T 为 Movie 类型
    func playMedia(_ media: FilmMaker.T) { // Filmmaker.T = Movie
    }
    func call(_ a: Int, b: Int, callback: CallBack) -> Int {
        return callback(a,b)
    }
}
