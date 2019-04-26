//
//  HeSlideViewController.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/4/25.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import UIKit
import SnapKit

class HeSlideViewController: UIViewController, HeSlideDelegate {

    // MARK: -属性
    //给默认值
    var mSlideView: HeSlideView = {
        return HeSlideView(frame: CGRect.zero, titles: nil, delegate: nil)
    }()
    let titles:[String] = ["头条","NBA","杭州","轻松一刻","娱乐","科技","体育"]
    var indexSelect = 0
    var vcSelect: UIViewController?
    
    //声明子Vc
    var v1: ViewController?,
    v2: ViewController?,
    v3: ViewController?,
    v4: ViewController?,
    v5: ViewController?,
    v6: ViewController?,
    v7: ViewController?
    
    // MARK: -周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.创建Slide视图
        let topInset = UIApplication.shared.statusBarFrame.height
        let rect = CGRect(x: 0, y: topInset, width: view.frame.width, height: 50)
        mSlideView = HeSlideView(frame: rect, titles: titles, delegate: self)
        view.addSubview(mSlideView)
        
        //2.添加子界面
        setUps()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Business
    
    func setUps() {
        v1 = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController)
        addChildViewController(v1!)
        view.addSubview(v1!.view)
        v1!.view.snp.makeConstraints { (make) in
            make.top.equalTo(mSlideView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        v1!.didMove(toParentViewController: self)
        vcSelect = v1
    }
    
    
    func clickAtIndex(index: Int) {
        
        var vc: ViewController?
        
        switch index {
        case 0:
            vc = v1
        case 1:
            vc = v2
        case 2:
            vc = v3
        case 3:
            vc = v4
        case 4:
            vc = v5
        case 5:
            vc = v6
        case 6:
            vc = v7
        default:
            vc = v1
        }
        
        if vc == nil {
            vc = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController)
        }
        
        //转场动画
        let valueR = CGFloat(arc4random() % 10) / 10.0;
        let valueG = CGFloat(arc4random() % 10) / 10.0;
        let valueB = CGFloat(arc4random() % 10) / 10.0;
        vc!.view.backgroundColor = UIColor.init(red: valueR, green: valueG, blue: valueB, alpha: 1)
        vc!.labelTitle = titles[index]
        
        addChildViewController(vc!)
        view.addSubview(vc!.view)
        
        //设置toVc的起始位置，接下来要执行动画
        vc!.view.snp.makeConstraints { (make) in
            make.top.equalTo(mSlideView.snp.bottom)
            make.leading.trailing.equalToSuperview().offset(view.frame.width)
            make.bottom.equalToSuperview()
        }
        
        transition(from: vcSelect!, to: vc!, duration: 0.5, options: .curveEaseInOut, animations: {
            //设置toVc的最终位置
            vc!.view.snp.remakeConstraints({ (make) in
                make.top.equalTo(self.mSlideView.snp.bottom)
                make.leading.trailing.bottom.equalToSuperview()
            })
        }) { (finish) in
            if finish {
                vc!.didMove(toParentViewController: self)
                /*执行完下面这两行之后，fromVc会从父控制器中移除并销毁，这里下次还要用，不能让其销毁
                * self.vcSelect!.willMove(toParentViewController: nil)
                * self.vcSelect!.removeFromParentViewController()
                */
 
            }else{
                print("++Animate UnFinished~")
            }
            self.indexSelect = index
            self.vcSelect = vc
        }
    }
    
    //MARK: -HeSlideDelegate
    
    func selectItemAtIndex(index: Int) {
        guard indexSelect != index else {
            return
        }
        print("++clicked btn at index: \(index)")
        
        clickAtIndex(index: index)
    }
}
