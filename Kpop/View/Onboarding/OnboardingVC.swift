//
//  OnboardingVC.swift
//  Kpop
//
//  Created by Douglas Gehring on 06/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class OnboardingVC: BaseViewController {

    @IBOutlet weak var welcomeTextPTLabel: UILabel!
    @IBOutlet weak var welcomeTextKRLabel: UILabel!
    @IBOutlet weak var onboardingTableView: UITableView!
    @IBOutlet weak var proceedBtn: UIBaseButton!
    
    private let viewModel = OnboardingViewModel()
    private let disposeBag = DisposeBag()
    var onboardingTableViewDelegate = BaseTableViewDelegate(heightForRow: 100.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBaseLayout()
        self.bindGreetingsTexts()
        self.registerNibForTableView()
        self.bindOnboardingTableView()
        self.bindTableViewToDelegate()
        self.bindProceedBtnTitle()
        self.configProceedBtnTapSubscriber()
    }
    
    private func bindProceedBtnTitle() {
        self.viewModel.proceedBtnText
            .subscribe(onNext: { [weak self] title in
                guard let self = self else { return }
                self.proceedBtn.configure(with: title)
            })
            .disposed(by: self.disposeBag)
    }

    private func configProceedBtnTapSubscriber() {
        self.proceedBtn
            .rx
            .tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.tagFirstUseAndDismissOnboarding()
                
            })
            .disposed(by: self.disposeBag)
    }
    
    @objc
    private func tagFirstUseAndDismissOnboarding() {
        AppFlowManager.shared.setAppFirstUse()
        self.dismiss(animated: true)
    }

    private func bindGreetingsTexts() {
        self.viewModel.welcomeTextKR
            .bind(to: self.welcomeTextKRLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        self.viewModel.welcomeTextPT
            .bind(to: self.welcomeTextPTLabel.rx.text)
            .disposed(by: self.disposeBag)
    }

    private func bindTableViewToDelegate() {
        self.onboardingTableView
            .rx
            .setDelegate(self.onboardingTableViewDelegate)
            .disposed(by: self.disposeBag)
    }
    
    private func registerNibForTableView() {
        self.onboardingTableView.register(cellType: BasicCell.self)
    }
    
    private func bindOnboardingTableView() {
        self.viewModel.onboardingSteps
            .bind(to: self.onboardingTableView.rx.items(cellIdentifier: "\(BasicCell.self)", cellType: BasicCell.self)) { _, onboardingStep, cell in
                cell.configure(for: onboardingStep)
        }
        .disposed(by: self.disposeBag)
    }

}
