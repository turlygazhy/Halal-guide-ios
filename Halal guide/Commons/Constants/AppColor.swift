//
//  AppColor.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit.UIColor

enum AppColor {
    case red
    case brown
    case lightBlue
    case transparentWhite
    case green
    case lightGray
    case darkGray
    case gray
    case lightGrayishOrange
    case mediumGray
    case turquoise
    case transparentBlack
    case redPaymentFailed
    case orange
    case grayAmountBlocked
    case greenAmountIncome
    case redCorporate
    case goldCorporate
    case blackCorporate
    case textColor
    case lightRed
    case timeUnselect
    case seperator
    
    var uiColor: UIColor {
        switch self {
        case .red: return UIColor(rgb: 238, 46, 37)
        case .brown: return UIColor(rgb: 58, 58, 58)
        case .lightBlue: return UIColor(rgb: 239, 243, 250)
        case .transparentWhite: return UIColor(rgb: 255, 255, 255, alpha: 50)
        case .green: return UIColor(rgb: 40, 183, 64)
        case .lightGray: return UIColor(rgb: 246, 246, 246)
        case .darkGray: return UIColor(rgb: 199, 199, 204)
        case .gray: return UIColor(rgb: 218, 218, 229)
        case .lightGrayishOrange: return UIColor(rgb: 244, 238, 234)
        case .mediumGray: return UIColor(rgb: 91, 93, 95)
        case .turquoise: return UIColor(rgb: 98, 164, 174)
        case .transparentBlack: return UIColor(rgb: 0, 0, 0, alpha: 40)
        case .redPaymentFailed: return UIColor(rgb: 238, 46, 37)
        case .orange: return UIColor(rgb: 250, 100, 68)
        case .grayAmountBlocked: return UIColor(rgb: 124, 124, 124)
        case .greenAmountIncome: return UIColor(rgb: 39, 156, 59)
        case .redCorporate: return UIColor(rgb: 210, 10, 16)
        case .goldCorporate: return UIColor(rgb: 188, 154, 92)
        case .blackCorporate: return UIColor(rgb: 35, 31, 32)
        case .textColor: return UIColor(rgb: 110, 114, 122)
        case .lightRed: return UIColor(rgb: 255, 235, 231)
        case .timeUnselect: return UIColor(rgb: 239, 239, 244)
        case .seperator: return UIColor(rgb: 224, 224, 224)
        }
    }
    
    var cgColor: CGColor { return uiColor.cgColor }
}

fileprivate extension UIColor {
    /// Initialize from integral RGB values (+ alpha channel in range 0-100)
    convenience init(rgb: UInt8..., alpha: UInt = 100) {
        self.init(
            red: CGFloat(rgb[0]) / 255,
            green: CGFloat(rgb[1]) / 255,
            blue: CGFloat(rgb[2]) / 255,
            alpha: CGFloat(min(alpha, 100)) / 100
        )
    }
}
