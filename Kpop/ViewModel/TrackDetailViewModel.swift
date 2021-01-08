//
//  TrackDetailViewModel.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation
import RxSwift


class TrackDetailViewModel  {
    
    private var lyricsID: String!
    private var trackLyrics: Lyrics?
    let loadingEnabled = BehaviorSubject<Bool>(value: false)
    let screenName = BehaviorSubject<String>(value: ScreenNames.trackDetail.rawValue)
    let currentLyricsText = BehaviorSubject<NSAttributedString?>(value: NSAttributedString(string: ""))
    let lyricTypeFilter = PublishSubject<LyricType>()
    
    private let disposeBag = DisposeBag()
    
    init(_ lyricsID: String) {
        self.lyricsID = lyricsID
        self.configLyricsFilterSubscriber()
    }
    
    private func configLyricsFilterSubscriber() {
        self.lyricTypeFilter
            .subscribe(onNext: { [weak self] lyricType in
                guard let self = self else { return }
                self.setLyricTextAccordingTo(lyricType)
            })
            .disposed(by: self.disposeBag)
    }
    
    private func setLyricTextAccordingTo(_ lyricType: LyricType) {
        guard let selectedLyrics = self.trackLyrics?.getLyrics(for: lyricType) else { return }
        self.currentLyricsText.onNext(selectedLyrics)
    }
    
    func loadLyricsForTrack() {
        self.loadingEnabled.onNext(true)
        DataManager.shared.loadLyrics(byID: self.lyricsID) { result in
            self.loadingEnabled.onNext(false)
            self.parseLyrics(loadResult: result)
        }
    }
    
    private func parseLyrics(loadResult: Result<Lyrics, Error>) {
        switch loadResult {
        case .success(let lyrics):
            self.trackLyrics = lyrics
            self.lyricTypeFilter.onNext(.hangoul)
        case .failure(let loadError):
            Logger.shared.log(error: loadError, location: "\(TrackDetailViewModel.self)")
        }
    }
}
