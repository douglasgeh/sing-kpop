//
//  TrackDetailVC.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TrackDetailVC: BaseViewController {

    @IBOutlet weak var lyricsTextView: UITextView!
    @IBOutlet weak var filterSegementedControl: UISegmentedControl!
    
    private let disposeBag = DisposeBag()
    private var viewModel: TrackDetailViewModel!
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let validLyricsID = self.track.lyricsID else {
            self.placeLyricsErrorView()
            return
        }
        self.viewModel = TrackDetailViewModel(validLyricsID)
        self.configLayout()
        self.bindLoadingIndicator()
        self.bindLyricTypeFilter()
        self.bindLyricsTextView()
        self.viewModel.loadLyricsForTrack()
    }
    
    private func bindLoadingIndicator() {
        self.viewModel.loadingEnabled
            .subscribe(onNext: { [weak self] loadingStatus in
                guard let self = self else { return }
                self.setLoadingIndicator(enabled: loadingStatus)
            })
            .disposed(by: self.disposeBag)
    }
    
    private func placeLyricsErrorView() {
        let errorView = ErrorView(frame: self.view.frame)
        errorView.configure(image: AppConstants.Design.Images.error404,
                            title: "Letra não encontrada",
                            description: "Por favor, tente novamente mais tarde!")
        errorView.center = self.view.center
        self.view.addSubview(errorView)
        
    }
    
    private func configLayout() {
        self.setBaseLayout()
        self.viewModel.screenName
            .bind(to: self.navigationItem.rx.title)
            .disposed(by: self.disposeBag)
    }
    
    private func bindLyricTypeFilter() {
        self.filterSegementedControl.rx.selectedSegmentIndex
            .subscribe(onNext: { [weak self] selectedIndex in
                guard let currentFilter = LyricType.from(index: selectedIndex),
                    let self = self else { return }
                self.viewModel.lyricTypeFilter.onNext(currentFilter)
            })
            .disposed(by: self.disposeBag)
    }
    

    private func bindLyricsTextView() {
        self.viewModel.currentLyricsText
            .subscribe(onNext: { [weak self] lyrics in
                guard let self = self else { return }
                self.lyricsTextView.attributedText = lyrics?
                    .set(textColor: AppConstants.Design.Colors.primaryText)
                    .set(font:  AppConstants.Design.Fonts.primaryTextRegular)
            })
            .disposed(by: self.disposeBag)
    }
}

