//
//  Track.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

enum TrackKeys : String {
    case id
    case date
    case name
    case artistName
    case lyricsID
    case artistID
}

struct Track {
    let id: String
    let date: Date?
    let name: String?
    let artistName: String?
    let lyricsID: String?
    let artistID: String?

    
    init(id: String, modelAdapter: DatabaseModelAdapter) {
        self.id = id
        self.date = modelAdapter[TrackKeys.date.rawValue] as? Date
        self.name = modelAdapter[TrackKeys.name.rawValue] as? String
        self.artistName = modelAdapter[TrackKeys.artistName.rawValue] as? String
        self.lyricsID = modelAdapter[TrackKeys.lyricsID.rawValue] as? String
        self.artistID = modelAdapter[TrackKeys.artistID.rawValue] as? String
    }
}
