//
//  HeOrientationViewController.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/4/29.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import UIKit

class HeOrientationViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mVideoView: UIView!
    
    var orientation: UIInterfaceOrientation {
        willSet {
            updateDirection(direction: newValue)
        }
        didSet {
            
        }
    }
    
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
            return .landscapeRight
        }
    }
    
    //旋转时 收到通知
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if size.width > size.height {
            label.text = "方向：横屏"
            //TODO: -修改布局
        }else{
            label.text = "方向：竖屏"
            //TODO: -修改布局
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .default
        }
    }
    
    init() {
        orientation = UIInterfaceOrientation.unknown
        super.init(nibName: "HeOrientationViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        orientation = UIInterfaceOrientation.unknown
        super.init(coder: aDecoder)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIApplicationDidChangeStatusBarOrientation, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = NotificationCenter.default
        
        ///设备方向的值与布局的值相反
        
        //设备旋转通知
        center.addObserver(self,selector: #selector(onOrientationUpdae(notification:)),
                           name: NSNotification.Name.UIDeviceOrientationDidChange,
                           object: nil)
        //布局旋转通知
        center.addObserver(self, selector: #selector(onStatusBarOrientationUpdate(notifi:)),
                           name: NSNotification.Name.UIApplicationDidChangeStatusBarOrientation,
                           object: nil)
        //针对本页面需求，强制设置界面方向
        UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func onPortrait(_ sender: Any) {
        orientation = UIInterfaceOrientation.portrait
        //label.text = "方向：竖屏"
    }
    
    @IBAction func onUpsideDown(_ sender: Any) {
        orientation = UIInterfaceOrientation.portraitUpsideDown
        //label.text = "方向：倒立"
    }
    
    @IBAction func onLandscapeLeft(_ sender: Any) {
        orientation = UIInterfaceOrientation.landscapeLeft
        //label.text = "方向：向左"
    }
    
    @IBAction func onLandscapeRight(_ sender: Any) {
        orientation = UIInterfaceOrientation.landscapeRight
        //label.text = "方向：向右"
    }
    
    
    func updateDirection(direction: UIInterfaceOrientation) {
        guard direction != UIInterfaceOrientation.unknown else {
            return
        }
        UIDevice.current.setValue(direction.rawValue, forKey: "orientation")
    }
    
    //设备旋转通知
    @objc func onOrientationUpdae(notification: Notification) {
        
        let orientation = UIDevice.current.orientation
        
        switch orientation {
        case .portrait:
            print("++设备：竖屏")
        case .landscapeLeft:
            print("++设备左屏：顶部在左")
        case .landscapeRight:
            print("++设备右屏：顶部在右")
        case .portraitUpsideDown:
            print("++设备：倒立")
        case .faceUp:
            print("++设备：face向上")
        case .faceDown:
            print("++设备：face向下")
        default:
            print("++设备：未知")
        }
    }
    
    //布局旋转通知
    @objc func onStatusBarOrientationUpdate(notifi: Notification) {
        
        let orientation = UIApplication.shared.statusBarOrientation
        var str = "unknown"
        
        switch orientation {
        case .portrait:
            str = "+++Home：竖屏布局~"
        case .landscapeLeft:
            str = "+++Home：在左横屏布局~"
        case .landscapeRight:
            str = "+++Home：在右横屏布局~"
        case .portraitUpsideDown:
            str = "+++Home：倒立布局~"
        default:
            str = "+++Home：未知~"
        }
        print(str)
    }
    
    @IBAction func onDismiss(_ sender: Any) {
        if let navi = navigationController {
            navi.dismiss(animated: true) {
            }
        }else{
            dismiss(animated: true) {
            }
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
