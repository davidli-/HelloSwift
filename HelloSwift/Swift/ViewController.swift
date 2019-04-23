//
//  ViewController.swift
//  HelloSwift
//
//  Created by Macmafia on 2018/8/23.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /**
     * # 多行注释
     * ## 支持 MarkDown
     * - push按钮
     * - 消失按钮
     * ## 按住键盘 option 键并单击下面的属性查看注释的效果
     */
    @IBOutlet weak var pushBtn: UIButton!
    @IBOutlet weak var dismissBtn: UIButton!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // FIXME: -不能再添加约束
        //setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //设置UI
    func setUI()
    {
        let btn = UIButton(type: .contactAdd)
        btn.addTarget(self, action:#selector(onDetail(sender:)), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.sizeToFit()
        view.addSubview(btn)
        
        let consX = NSLayoutConstraint(item: btn, attribute: .centerX, relatedBy: .equal,
                                       toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let consY = NSLayoutConstraint(item: btn, attribute: .top, relatedBy: .equal,
                                      toItem: dismissBtn, attribute: .bottom, multiplier: 1.0, constant: 20)
        view.addConstraints([consX,consY])
        
        
    }
    
    // MARK: - @objc selector
    //相当于pragma mark
    @objc func onDetail(sender: Any) {
        print("onClicked btn~")
        
        // TODO: -测试TODO标签
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                     selector: #selector(onTimer), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .commonModes)
        
        //block 定时器
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { aTimer in
            print("++call blockTimer~")
        }
    }
    
    @objc func onTimer() {
        print("++on Timer~")
    }
    
    deinit{
        print("++ deinited !")
    }
    
    @IBAction func onAction(_ sender: Any) {
        let board = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = board.instantiateViewController(withIdentifier: "v")
        let valueR = CGFloat(arc4random() % 10) / 10.0;
        let valueG = CGFloat(arc4random() % 10) / 10.0;
        let valueB = CGFloat(arc4random() % 10) / 10.0;
        viewController.view.backgroundColor = UIColor.init(red: valueR, green: valueG, blue: valueB, alpha: 1)
        present(viewController,animated: true,completion: nil)
    }
    
    @IBAction func onDismissAction(_ sender: Any) {
        timer?.invalidate()
        dismiss(animated: true, completion: nil)
    }
}

