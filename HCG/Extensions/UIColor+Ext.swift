//
//  UIColor+Ext.swift
//  BiMac
//
//  Created by Hasan Can on 24.11.2020.
//

import Foundation
import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
    
    static var mainGreenColor: UIColor {
        return UIColor(red: 0/255, green: 198/255, blue: 120/255, alpha: 1.0)
    }
}
