//
//  ErrorLog.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

class Logger {
    static let shared = Logger()
    func log(error: Error, location: String? = nil) {
        print("Error: \(error.localizedDescription)")
        print("Current location: \(location ?? "Not available")")
    }
    
    func log(data: Any, location: String? = nil) {
        print("Data: \(data)")
        print("Current location: \(location ?? "Not available")")
    }
}
