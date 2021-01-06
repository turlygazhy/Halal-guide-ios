//
//  NavigationController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, BaseViewControllerProtocol {
    
    private var dismissButtonComletion: VoidCompletion?
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityIndicator.backgroundColor = AppColor.brown.uiColor.withAlphaComponent(0.5)
        return activityIndicator
    }()
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // Remove title from backBarButtonItem
        viewControllers.last?.navigationItem.backBarButtonItem = EmptyTitleBarButtonItem()
        
        super.pushViewController(viewController, animated: animated)
    }
    
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
    
    func setDismissButton(with completion: VoidCompletion? = nil) {
        guard let viewController = viewControllers.last else { return }
        let dismissButtonItem = UIBarButtonItem()
//        dismissButtonItem.image = AppImage.dismissIcon.uiImage?.fitted(in: CGSize(width: 18, height: 18))
        dismissButtonItem.action = #selector(dismissAnimated)
        dismissButtonComletion = completion
        viewController.navigationItem.rightBarButtonItem = dismissButtonItem
    }
    
    @objc private func dismissAnimated() {
        dismiss(animated: true, completion: dismissButtonComletion)
    }
    
    func hideBackButton() {
        guard let viewController = viewControllers.last else { return }
        viewController.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    var customModalPresentationStyle: UIModalPresentationStyle { return .overFullScreen }
}
