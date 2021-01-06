//
//  BaseViewControllerProtocol.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

protocol BaseViewControllerProtocol: BaseViewInputProtocol where Self: UIViewController {
    var activityIndicator: UIActivityIndicatorView { get }
    var customModalPresentationStyle: UIModalPresentationStyle { get }
}

extension BaseViewControllerProtocol {
    
    func setUI(interactionEnabled enabled: Bool) {
        view.isUserInteractionEnabled = enabled
    }
    
    func showError(message: String, completion: VoidCompletion?) {
        let alert = UIAlertController(title: "Внимание", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            completion?()
        }
        alert.addAction(cancel)
        presentOnTop(alert, animated: true, completion: nil)
    }
    
    func showError(_ error: AppError, onDismiss perform: (() -> Void)? = nil) {
        showError(message: error.description, completion: perform)
    }
    
    func showSuccess(message: String, completion: VoidCompletion?) {
        let alert = UIAlertController(title: "Cообщение", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "ОК", style: .cancel) { _ in
            completion?()
        }
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func showActivityIndicator() {
        let viewController = tabBarController ?? navigationController ?? self
        activityIndicator.frame = CGRect(
            x: 0,
            y: 0,
            width: viewController.view.frame.width,
            height: viewController.view.frame.height
        )
        viewController.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    func showOption(message: String, onOptionSelect perform: @escaping (_ isOkOptionSelected: Bool) -> Void) {
        let alertController = UIAlertController(title: "Внимание", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in perform(true) }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in perform(false) }
        alertController.addAction(okAction)
        alertController.addAction(cancel)
        presentOnTop(alertController, animated: true)
    }
    
    func getTopmostViewController() -> UIViewController {
        return getTopmostViewControllerFromChain(thatContains: self)
    }
    
    private func getTopmostViewControllerFromChain(thatContains viewController: UIViewController) -> UIViewController {
        if let navigationController = viewController as? UINavigationController {
            if let visibleViewController = navigationController.visibleViewController {
                return getTopmostViewControllerFromChain(thatContains: visibleViewController)
            }
        } else if let tabBarController = viewController as? UITabBarController {
            if let selected = tabBarController.selectedViewController {
                return getTopmostViewControllerFromChain(thatContains: selected)
            }
        } else if let presentedViewController = viewController.presentedViewController {
            return getTopmostViewControllerFromChain(thatContains: presentedViewController)
        }
        
        return viewController
    }
    
    func presentWithTransitionFromRight(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        transition.timingFunction = CAMediaTimingFunction(name: .easeIn)
        view.window?.layer.add(transition, forKey: kCATransition)

        present(viewController, animated: false) { [unowned self] in
            self.view.window?.layer.removeAnimation(forKey: kCATransition)
        }
    }
    
    func dismissWithTransitionFromLeft() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .moveIn
        transition.subtype = .fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false) { [unowned self] in
            self.view.window?.layer.removeAnimation(forKey: kCATransition)
        }
    }
    
    // Can return UIAlertController
    func getPresentedViewController() -> UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    func presentOnTop(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        let topMostViewController = getPresentedViewController()
        if topMostViewController is UIAlertController {
            let presentingViewController = topMostViewController?.presentingViewController
            topMostViewController?.dismiss(animated: false) {
                presentingViewController?.present(viewController, animated: animated, completion: completion)
            }
            return
        }
        topMostViewController?.present(viewController, animated: animated, completion: completion)
    }
}
