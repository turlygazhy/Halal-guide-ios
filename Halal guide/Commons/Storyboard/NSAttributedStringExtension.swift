//
//  NSAttributedStringExtension.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 28.09.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    static func makeHyperLink(for path: String, in string: String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let subStringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: subStringRange)
        return attributedString
    }
    
}
