//
//  AppFlowManager.swift
//  Kpop
//
//  Created by Douglas Gehring on 06/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

enum FlowSteps {
    case onboarding
    case mainFlow
    case trackDetail
}

class AppFlowManager {
    static let shared = AppFlowManager()
    
    var isAppFirstUse : Bool {
        self.loadAppFirstUse()
    }
    
    func loadOnboarding() -> UIViewController {
         return OnboardingVC()
    }
    
    private func loadMainFlow() -> UIViewController {
        let tracksListVC = TracksListVC()
        let tracksNavigation = UINavigationController(rootViewController: tracksListVC)
        tracksNavigation.navigationBar.prefersLargeTitles = true
        tracksNavigation.modalPresentationStyle = .fullScreen
        return tracksNavigation
    }
    
    func loadTrackDetail(_ track: Track) -> UIViewController {
        let trackDetailVC = TrackDetailVC()
        trackDetailVC.track = track
        return trackDetailVC
    }
    
    func loadAppFirstUse() -> Bool {
        return !UserDefaults.standard.bool(forKey: AppConstants.Keys.fstUse.rawValue)
    }
    
    func setAppFirstUse() {
        UserDefaults.standard.set(true, forKey: AppConstants.Keys.fstUse.rawValue)
    }
    
    func start() -> UIViewController {
        return self.loadMainFlow()
    }
}
