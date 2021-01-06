//
//  BaseViewInputProtocol.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

typealias VoidCompletion = (() -> Void)

protocol ActivityIndicatorPresentable {
    func showActivityIndicator()
    func hideActivityIndicator()
}

protocol AlertPresentable {
    func showError(message: String, completion: VoidCompletion?)
    func showSuccess(message: String, completion: VoidCompletion?)
    func showOption(message: String, onOptionSelect perform: @escaping (_ isOkOptionSelected: Bool) -> Void)
    func showError(_ error: AppError, onDismiss perform: (() -> Void)?)
}

protocol UISetable {
    func setUI(interactionEnabled enabled: Bool)
}

protocol BaseViewInputProtocol: class, ActivityIndicatorPresentable, AlertPresentable, UISetable {
    func lock()
    func unlock()
}

extension BaseViewInputProtocol {
    
    func showError(message: String, completion: VoidCompletion? = nil) {
        showError(message: message, completion: completion)
    }
    
    func showSuccess(message: String) {
        showSuccess(message: message, completion: nil)
    }
    
    func showOption(message: String, onOptionSelect perform: @escaping (_ isOkOptionSelected: Bool) -> Void) {
        showOption(message: message, onOptionSelect: perform)
    }
    
    func lock() {
        setUI(interactionEnabled: false)
        showActivityIndicator()
    }
    
    func unlock() {
        hideActivityIndicator()
        setUI(interactionEnabled: true)
    }    
}
