//
//  Lyrics.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

enum LyricsKeys: String {
    case id
}

enum LyricType: String {
    case hangoul
    case romanized
    case simplified
    
    static func from(index: Int) -> LyricType? {
        if index == 0 { return .hangoul }
        else if index == 1 { return .romanized }
        else if index == 2 { return .simplified }
        else { return nil}
    }
}

struct Lyrics {
    let id: String
    var hangoul: NSAttributedString?
    var romanized: NSAttributedString?
    var simplified: NSAttributedString?
    
    init(id: String, modelAdapter: DatabaseModelAdapter) {
        self.id = id
        self.loadAttributedString(forLyricType: .hangoul, from: modelAdapter)
        self.loadAttributedString(forLyricType: .romanized, from: modelAdapter)
        self.loadAttributedString(forLyricType: .simplified, from: modelAdapter)
    }
    
    func getLyrics(for lyricType: LyricType) -> NSAttributedString? {
        switch lyricType {
        case .hangoul: return self.hangoul
        case .romanized: return self.romanized
        case .simplified: return self.simplified
        }
    }
    
    mutating private func loadAttributedString(forLyricType lyricType: LyricType, from modelAdapter: DatabaseModelAdapter) {
        
        guard let html = modelAdapter[lyricType.rawValue] as? String else {
            Logger.shared.log(error: ErrorDefinitions.nullElements, location: "\(Lyrics.self)")
            return
        }
        
        html.toNSAttributedString { result in
            switch result {
            case .success(let attributedString): self.save(attributedString, to: lyricType)
            case .failure(let error): Logger.shared.log(error: error, location: "\(Lyrics.self)")
            }
        }
    }
    
    mutating private func save(_ attributedString: NSAttributedString, to lyricType: LyricType) {
        switch lyricType {
        case .hangoul: self.hangoul = attributedString
        case .romanized: self.romanized = attributedString
        case .simplified: self.simplified = attributedString
        }
    }
}
