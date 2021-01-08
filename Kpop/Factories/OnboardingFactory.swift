//
//  OnboardingFactory.swift
//  Kpop
//
//  Created by Douglas Gehring on 07/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation


class OnboardingFactory {
    static let shared = OnboardingFactory()
    
    func loadSteps() -> [OnboardingStep] {
        return [
            OnboardingDefinitions.FirstStep(),
            OnboardingDefinitions.SecondStep(),
            OnboardingDefinitions.ThirdStep()
        ]
    }
}
