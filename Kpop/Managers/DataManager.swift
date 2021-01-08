//
//  DataManager.swift
//  Kpop
//
//  Created by Douglas Gehring on 06/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    func loadLyrics(byID lyricsID: String, completion: @escaping(Result<Lyrics, Error>) -> Void) {
        FirebaseClient.shared.loadModelAdapter(forPath: DatabasePathAdapter.lyrics.toDatabasePath(byID: lyricsID)) { result in
            switch result {
            case .success(let modelAdapter):
                let lyrics = Lyrics(id: lyricsID, modelAdapter: modelAdapter)
                completion(.success(lyrics))
            case .failure(let error):
                completion(.failure(error))
                Logger.shared.log(error: error, location: "\(DataManager.self)")
            }
        }
    }
    
    func loadTracks(completion: @escaping(Result<[Track], Error>) -> Void) {
        FirebaseClient.shared.loadModelAdapter(forPath: DatabasePathAdapter.tracks.toDatabasePath()) { result in
            switch result {
            case .success(let modelAdapter):
                completion(.success(self.parseTracks(fromModelAdapter: modelAdapter)))
            case .failure(let error):
                completion(.failure(error))
                Logger.shared.log(error: error, location: "\(DataManager.self)")
            }
        }
    }
    
    private func parseTracks(fromModelAdapter modelAdapter: DatabaseModelAdapter) -> [Track] {
        var tracks:[Track] = []
        
        modelAdapter.forEach { entry in
            if let trackAdapter = entry.value as? DatabaseModelAdapter {
                let newTrack = Track(id: entry.key, modelAdapter: trackAdapter)
                tracks.append(newTrack)
            }
        }
        
        return tracks
    }

}
