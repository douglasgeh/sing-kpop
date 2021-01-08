//
//  BaseButton.swift
//  Kpop
//
//  Created by Douglas Gehring on 07/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

class UIBaseButton: UIButton {
    func configure(with title: String) {
        self.backgroundColor = AppConstants.Design.Colors.accent
        self.titleLabel?.font = AppConstants.Design.Fonts.primaryTextMedium
        self.setTitleColor(AppConstants.Design.Colors.primaryText, for: .normal)
        self.layer.cornerRadius = 6.0
        self.setTitle(title, for: .normal)
    }
}


