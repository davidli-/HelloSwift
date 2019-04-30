//
//  HeParentViewController.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/4/30.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import UIKit

class HeParentViewController: UIViewController {

    //支持旋转屏
    override var shouldAutorotate: Bool {
        get {
            return true
        }
    }
    
    //支持横屏旋转
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .allButUpsideDown
        }
    }
    
    //模态弹出当前页面时 默认的布局方向
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        get {
            return .portrait
        }
    }
    
    //状态栏不隐藏
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    //状态栏默认样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .default
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //强制设置界面方向
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
}
