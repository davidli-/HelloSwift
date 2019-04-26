//
//  HeSlideView.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/4/26.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import UIKit

//声明协议 代理点击事件
protocol HeSlideDelegate {
    func selectItemAtIndex(index: Int)
}

class HeSlideView: UIScrollView {

    //MARK: -属性
    let titles:[String]?
    let mDelegate: HeSlideDelegate?
    
    //MARK: -重写
    required init?(coder aDecoder: NSCoder)
    {
        titles = [String]()
        mDelegate = nil
        super.init(coder: aDecoder)
    }
    
    //对外接口
    init(frame: CGRect, titles: [String]?, delegate: HeSlideDelegate?)
    {
        self.titles = titles
        mDelegate = delegate
        super.init(frame: frame)
        
        setUps()
        //添加按钮
        addTitles()
    }
    
    //MARK: -自定义
    func setUps() {
        bounces = false
        backgroundColor = UIColor.white
        showsHorizontalScrollIndicator = false
    }
    
    //添加按钮
    func addTitles() {
        guard (titles != nil) else {
            return
        }
        let padding: CGFloat = 20.0
        var contentWidth: CGFloat = CGFloat(titles!.count + 1) * padding
        var lastBtn: UIButton?
        
        for (i,item) in titles!.enumerated()
        {
            let btn = UIButton(type: .custom)
            btn.tag = i
            addSubview(btn)
            btn.addTarget(self, action: #selector(onItemsSelect(sender:)), for: .touchUpInside)
            
            btn.setTitle(item, for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.backgroundColor = UIColor.black
            btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10)
            btn.sizeToFit()
            
            contentWidth += btn.frame.width
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                if lastBtn == nil {
                    make.leading.equalToSuperview().offset(padding)
                }else{
                    make.leading.equalTo(lastBtn!.snp.trailing).offset(padding)
                }
                make.height.equalTo(25)
            }
            lastBtn = btn
        }
        contentSize.width = contentWidth
    }
    
    //MARK: -Selector
    @objc func onItemsSelect(sender: Any){
        if let btn = sender as? UIButton {
            let index = btn.tag
            mDelegate?.selectItemAtIndex(index: index)
        }
    }
}
