//
//  BasePresenterProtocols.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

protocol Loadable {
    func startLoading()
    func stopLoading()
}

protocol StatusPresentableProtocol {
    func showError(_ error: AppError, completion: VoidCompletion?)
    func showSuccess(message: String, completion: (() -> Void)?)
    func showOption(message: String, onOptionSelect perform: @escaping (_ isOkOptionSelected: Bool) -> Void)
}

protocol BasePresenterInput: StatusPresentableProtocol, Loadable, ViewLoadable {
    var baseView: BaseViewInputProtocol { get }
}

extension BasePresenterInput {
    
    func showError(_ error: AppError, completion: VoidCompletion? = nil) {
        baseView.hideActivityIndicator()
        baseView.setUI(interactionEnabled: true)
        baseView.showError(message: error.description, completion: completion)
    }
    
    func showError(message: String) {
        baseView.hideActivityIndicator()
        baseView.setUI(interactionEnabled: true)
        baseView.showError(message: message)
    }
    
    func showSuccess(message: String, completion: (() -> Void)? = nil) {
        baseView.hideActivityIndicator()
        baseView.setUI(interactionEnabled: true)
        baseView.showSuccess(message: message, completion: completion)
    }
    
    func showOption(message: String, onOptionSelect perform: @escaping (_ isOkOptionSelected: Bool) -> Void) {
        baseView.hideActivityIndicator()
        baseView.setUI(interactionEnabled: true)
        baseView.showOption(message: message, onOptionSelect: perform)
    }
    
    func startLoading() {
        baseView.showActivityIndicator()
        baseView.setUI(interactionEnabled: false)
    }
    
    func stopLoading() {
        baseView.hideActivityIndicator()
        baseView.setUI(interactionEnabled: true)
    }
    
}
