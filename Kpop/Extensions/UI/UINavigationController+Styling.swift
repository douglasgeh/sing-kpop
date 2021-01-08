//
//  UINavigationController+Styling.swift
//  Kpop
//
//  Created by Douglas Gehring on 07/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func clearBackground() {
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
}

