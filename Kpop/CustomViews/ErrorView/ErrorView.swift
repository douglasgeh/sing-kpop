//
//  ErrorView.swift
//  Goove
//
//  Created by Douglas Gehring on 20/10/20.
//  Copyright © 2020 Douglas Gehring. All rights reserved.
//

import UIKit

class ErrorView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var errorDescriptionLabel: UILabel!
    @IBOutlet var errorTitleLabel: UILabel!
    @IBOutlet var errorImage: UIImageView!
    
    let kCONTENT_XIB_NAME = "ErrorView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func configure(image: UIImage, title: String, description: String) {
        self.errorImage.image = image
        self.errorTitleLabel.text = title
        self.errorDescriptionLabel.text = description
    }
}
