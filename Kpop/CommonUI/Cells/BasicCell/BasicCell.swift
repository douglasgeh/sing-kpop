//
//  TrackCell.swift
//  Kpop
//
//  Created by Douglas Gehring on 06/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.tintColor = AppConstants.Design.Colors.primaryText
    }
    
    private func loadAcessoryType() {
        let disclosureIndicator = AppConstants.Design.Images.disclosureIndicator
        let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(disclosureIndicator?.size.width)!, height:(disclosureIndicator?.size.height)!))
        accessory.image = disclosureIndicator
        accessory.tintColor = AppConstants.Design.Colors.primaryText
        self.accessoryView = accessory
    }
    
    func configure(for track: Track) {
        self.imageView?.image = AppConstants.Design.Images.music
        self.textLabel?.text = track.name
        self.textLabel?.setBaseTitleCellLayout()
        self.detailTextLabel?.text = track.artistName
        self.detailTextLabel?.setDescriptionTitleCellLayout()
        self.backgroundColor = AppConstants.Design.Colors.cellBackground
        self.loadAcessoryType()
    }
    
    func configure(for onboardingStep: OnboardingStep) {
        self.imageView?.image = onboardingStep.img
        self.textLabel?.text = onboardingStep.title
        self.textLabel?.setBaseTitleCellLayout()
        self.detailTextLabel?.text = onboardingStep.description
        self.detailTextLabel?.setDescriptionTitleCellLayout()
        self.backgroundColor = AppConstants.Design.Colors.clear
    }
}
