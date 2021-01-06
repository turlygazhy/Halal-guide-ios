//
//  EmptyTitleBarButtonItem.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class EmptyTitleBarButtonItem: UIBarButtonItem {
    
    override init() {
        super.init()
        title = ""
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
