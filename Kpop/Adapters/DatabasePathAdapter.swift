//
//  DatabasePathAdapter.swift
//  Kpop
//
//  Created by Douglas Gehring on 06/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

enum DatabasePathAdapter: String {
    case lyrics
    case artists
    case tracks
    
    func toDatabasePath(byID id: String? = nil) -> String {
        guard let id = id else {
            return "\(self.rawValue)"
        }
        return "\(self.rawValue)/\(id)"
    }
    
}
