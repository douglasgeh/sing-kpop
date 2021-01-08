//
//  ErrorDefinitions.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

enum ErrorDefinitions: LocalizedError {
    
    case nullElements
    case snapValueNullOrCastMissmatch
    case snapCastMissmatch
    case nullPath
    case htmlConversionError
    
    var errorDescription: String? {
        switch self {
        case .nullElements: return "Null elements error"
        case .snapValueNullOrCastMissmatch: return "Snap value null or cast missmatch"
        case .snapCastMissmatch: return "Snap cast missmatch"
        case .nullPath: return "Provided path is null"
        case .htmlConversionError: return "HTML conversion to attributed string error "
        }
    }
    
    var errorCode: Int? {
        switch self {
        case .nullElements: return nil
        case .snapValueNullOrCastMissmatch: return nil
        case .snapCastMissmatch: return nil
        case .nullPath: return nil
        case .htmlConversionError: return nil
        }
    }
}
