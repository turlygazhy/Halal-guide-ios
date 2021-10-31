//
//  UIViewController+Extensions.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 31.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showToast(message: String) {//todo test on small screen
        let toastLabel = UILabel(frame: CGRect(x: 15, y: self.view.frame.size.height-175, width: self.view.frame.size.width - 30, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = .systemFont(ofSize: 14)
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 3
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 6.0, delay: 0.1, options: .curveEaseInOut, animations: {
                 toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
    }
    
}
