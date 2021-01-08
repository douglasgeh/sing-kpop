//
//  UILabel+Styling.swift
//  Kpop
//
//  Created by Douglas Gehring on 06/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

extension UILabel {
    func setBaseTitleCellLayout() {
        self.textColor = AppConstants.Design.Colors.primaryText
        self.font = AppConstants.Design.Fonts.primaryTextBold
    }
    
    func setDescriptionTitleCellLayout() {
        self.textColor = AppConstants.Design.Colors.secondaryText
        self.font = AppConstants.Design.Fonts.secondaryTextRegular
        self.numberOfLines = 2
    }
}
