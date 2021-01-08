//
//  TracksListVC.swift
//  Kpop
//
//  Created by Douglas Gehring on 06/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit
import RxSwift

class TracksListVC: BaseViewController {

    @IBOutlet weak var tracksTableView: UITableView!

    private var viewModel = TracksListViewModel()
    private let disposeBag = DisposeBag()
    private let tracksTableViewDelegate = BaseTableViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNibsForTableView()
        self.bindTracksListToTableView()
        self.bindTableViewToDelegate()
        self.bindTracksTableViewTap()
        self.bindLoadingIndicator()
        self.configLayout()
        self.viewModel.loadTracksList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.solveOnboardingPresentation()
    }
    
    private func solveOnboardingPresentation() {
        guard AppFlowManager.shared.isAppFirstUse else { return }
        let onboardingFlow = AppFlowManager.shared.loadOnboarding()
        self.navigationController?.present(onboardingFlow, animated: true)
    }
    
    private func configLayout() {
        self.setBaseLayout()
        self.viewModel.screenName
            .bind(to: self.navigationItem.rx.title)
            .disposed(by: self.disposeBag)
    }
    
    private func registerNibsForTableView() {
        self.tracksTableView.register(cellType: BasicCell.self)
    }
    
    private func bindLoadingIndicator() {
        self.viewModel.loadingStatus
            .subscribe(onNext: { [weak self] loadingStatus in
                guard let self = self else { return }
                self.setLoadingIndicator(enabled: loadingStatus)
            })
            .disposed(by: self.disposeBag)
    }
    
    private func bindTableViewToDelegate() {
        self.tracksTableView
            .rx
            .setDelegate(self.tracksTableViewDelegate)
            .disposed(by: self.disposeBag)
    }
    
    private func bindTracksTableViewTap() {
        self.tracksTableView
            .rx
            .modelSelected(Track.self)
            .subscribe(onNext: { [weak self] (track) in
                guard let self = self else { return }
                self.presentTrackDetailsVC(for: track)
        })
            .disposed(by: self.disposeBag)

    }
    
    private func bindTracksListToTableView() {
        self.viewModel.tracksList
            .bind(to: self.tracksTableView.rx.items(cellIdentifier: "\(BasicCell.self)", cellType: BasicCell.self)) { _, track, cell in
                cell.configure(for: track)
        }
        .disposed(by: self.disposeBag)
    }
    
    private func presentTrackDetailsVC(for track: Track) {
        let nextFlowStep = AppFlowManager.shared.loadTrackDetail(track)
        self.navigationController?.pushViewController(nextFlowStep, animated: true)
    }
}
