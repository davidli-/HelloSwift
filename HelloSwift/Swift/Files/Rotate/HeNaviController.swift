//
//  HeNaviController.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/4/30.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import UIKit

class HeNaviController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: -如果VC在导航器中，则g导航器也要重写下面三个关于设备旋转的属性
    override var shouldAutorotate: Bool {
        get {
            return true
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            if let vc = visibleViewController as? HeOrientationViewController {
                return vc.supportedInterfaceOrientations
            }else{
                return .allButUpsideDown
            }
        }
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        get {
            if let vc = visibleViewController as? HeOrientationViewController {
                return vc.preferredInterfaceOrientationForPresentation
            }else{
                return .portrait
            }
        }
    }
}
