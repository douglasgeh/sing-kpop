//
//  TrackListVM.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation
import RxSwift


class TracksListViewModel  {
    
    let tracksList = BehaviorSubject<[Track]>(value: [])
    let screenName = BehaviorSubject<String>(value: ScreenNames.tracksList.rawValue)
    let loadingStatus = BehaviorSubject<Bool>(value: false)
    
    func loadTracksList() {
        self.loadingStatus.onNext(true)
        DataManager.shared.loadTracks { result in
            self.loadingStatus.onNext(false)
            self.parseTracks(loadResult: result)
        }
    }
    
    private func parseTracks(loadResult: Result<[Track], Error>) {
        switch loadResult {
        case .success(let tracks):
            self.tracksList.onNext(tracks)
        case .failure(let loadError):
            Logger.shared.log(error: loadError, location: "\(TracksListViewModel.self)")
        }
    }
}
