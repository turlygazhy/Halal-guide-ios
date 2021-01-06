//
//  BaseViewController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityIndicator.backgroundColor = AppColor.brown.uiColor.withAlphaComponent(0.5)
        return activityIndicator
    }()
    
    override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)? = nil
    ) {
        // Temporary solution: to bring back original modal presentation style used in versions < iOS 13
        if let viewControllerToPresent = viewControllerToPresent as? BaseViewControllerProtocol {
            viewControllerToPresent.modalPresentationStyle = viewControllerToPresent.customModalPresentationStyle
        } else {
            viewControllerToPresent.modalPresentationStyle = customModalPresentationStyle
        }
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    var customModalPresentationStyle: UIModalPresentationStyle { return .overFullScreen }
}
