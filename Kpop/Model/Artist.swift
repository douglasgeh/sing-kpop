//
//  Artist.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

enum ArtistKeys: String {
    case id
    case name
    case company
}

struct Artist {
    let id: String
    let name: String?
    let company: String?
    
    init(id: String, modelAdapter: DatabaseModelAdapter) {
        self.id = id
        self.name = modelAdapter[ArtistKeys.name.rawValue] as? String
        self.company = modelAdapter[ArtistKeys.company.rawValue] as? String
    }
}
