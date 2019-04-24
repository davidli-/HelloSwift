//
//  HeExpandButton.swift
//  HelloSwift
//
//  Created by Macmafia on 2019/4/24.
//  Copyright © 2019 Macmafia. All rights reserved.
//

import Foundation
import UIKit

class HeExpandButton: UIButton {
    //重写 增加识别区域
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var bounds = self.bounds
        bounds = bounds.insetBy(dx: -25, dy: -25)
        return bounds.contains(point)
    }
}
