//
//  String+HTMLConverter.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

extension String {
    func toNSAttributedString(result: (Result<NSAttributedString, Error>) -> Void) {
        let htmlData = Data(self.utf8)
    
        guard let attributedString = try? NSAttributedString(data: htmlData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) else {
            result(.failure(ErrorDefinitions.htmlConversionError))
            return
        }
        
        result(.success(attributedString))
    }
}
