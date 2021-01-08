//
//  OnboardingViewModel.swift
//  Kpop
//
//  Created by Douglas Gehring on 07/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation
import RxSwift

struct OnboardingViewModel {
    
    let onboardingSteps = BehaviorSubject<[OnboardingStep]>(value: OnboardingFactory.shared.loadSteps())
    let welcomeTextPT = BehaviorSubject<String>(value: "Bem vindo(a)!")
    let welcomeTextKR = BehaviorSubject<String>(value: "어서 오십시오")
    let proceedBtnText = BehaviorSubject<String>(value: "Vamos lá!")
}
