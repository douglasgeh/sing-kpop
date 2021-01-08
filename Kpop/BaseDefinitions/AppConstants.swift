//
//  AppConstants.swift
//  Kpop
//
//  Created by Douglas Gehring on 06/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

struct AppConstants {
    
    struct Design {
        struct Colors {
            static let accent = #colorLiteral(red: 0.2549019608, green: 0.3098039216, blue: 0.8274509804, alpha: 1)
            static let primaryText = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            static let secondaryText = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            static let viewBackground = #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1176470588, alpha: 1)
            static let cellBackground = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1039623331)
            static let clear = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        
        struct Fonts {
            static let primaryTextRegular = UIFont.systemFont(ofSize: 17.0, weight: .regular)
            static let primaryTextMedium = UIFont.systemFont(ofSize: 17.0, weight: .medium)
            static let primaryTextBold = UIFont.systemFont(ofSize: 17.0, weight: .bold)
            
            static let secondaryTextRegular = UIFont.systemFont(ofSize: 15.0, weight: .regular)
            static let secondaryTextMedium = UIFont.systemFont(ofSize: 15.0, weight: .medium)
            static let secondaryTextBold = UIFont.systemFont(ofSize: 15.0, weight: .bold)
            
        }
        
        struct Images {
            static let error404 = #imageLiteral(resourceName: "error_404")
            static let music = #imageLiteral(resourceName: "music")
            static let disclosureIndicator = UIImage(systemName: "chevron.right")
            static let onboardingFst = #imageLiteral(resourceName: "onboarding_1")
            static let onboardingSnd = #imageLiteral(resourceName: "onboarding_2")
            static let onboardingThrd = #imageLiteral(resourceName: "onboarding_3")
            static let topImg = #imageLiteral(resourceName: "top_img")
        }
    }
    
    struct Logics {
        struct Tags {
            static let loadingIndicator = -1
        }
        
        struct Dimensions {
            static let rowBaseHeight: CGFloat = 70.0
            static let buttonSize: CGSize = CGSize(width: 300, height: 45)
        }
        
        struct LayoutOffsets {
            static let controllerBottom: CGFloat = 30.0
        }
    }
    
    enum Keys: String {
        case fstUse
    }
}
