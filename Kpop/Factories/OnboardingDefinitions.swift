//
//  OnboardingDefinitions.swift
//  Kpop
//
//  Created by Douglas Gehring on 07/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

protocol OnboardingStep {
    var title: String { get }
    var description: String { get }
    var img: UIImage { get }
}

struct OnboardingDefinitions {
    struct FirstStep: OnboardingStep {
        var title = "Cante kpop"
        var description = "Aprenda a cantar Kpop de forma rápida"
        var img = AppConstants.Design.Images.onboardingFst
    }
    
    struct SecondStep: OnboardingStep {
        let title = "Melhore sua pronúncia"
        let description = "Letras: Hangoul, Romanizada e Simplificada"
        var img = AppConstants.Design.Images.onboardingSnd
    }
    
    struct ThirdStep: OnboardingStep {
        let title = "Compartilhe com amigos"
        let description = "Nos ajude a crescer!"
        var img =  AppConstants.Design.Images.onboardingThrd
    }
}
