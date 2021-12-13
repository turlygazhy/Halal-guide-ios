//
//  MenuViewController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit
import StoreKit

class MenuViewController: BaseViewController {
    
    var router: MenuRouterInput?
    var interactor: MenuInteractorInput?
    
    let APP_LINK = "https://apps.apple.com/kz/app/halal-guide-kz/id1598839456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Меню"
    }
    
    @IBAction func markApp(_ sender: Any) {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            UIApplication.shared.open(URL(string: APP_LINK)!)
        }
    }
    
    @IBAction func shareApp(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [APP_LINK], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
}

extension MenuViewController: MenuViewInput {
    func reloadPage() {
        
    }
}
