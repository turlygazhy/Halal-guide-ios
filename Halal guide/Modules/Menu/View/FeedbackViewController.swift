//
//  FeedbackViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 12.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Обратная связь"
    }
    
    @IBAction func openWhatsapp(_ sender: Any) {//todo test it
        openLink(url: "https://api.whatsapp.com/send?phone=77714370517&text=&source=&data=")
    }
    
    @IBAction func openInstagram(_ sender: Any) {//todo test
        openLink(url: "https://www.instagram.com/halaldamu.kz/")
    }
    
    @IBAction func openMail(_ sender: Any) {//todo test
        openLink(url: "mailto:kmdbhalal@mail.ru")
    }
    
    func openLink(url: String) {
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
    }
    
}
