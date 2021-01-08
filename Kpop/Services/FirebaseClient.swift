//
//  FirebaseClient.swift
//  Kpop
//
//  Created by Douglas Gehring on 05/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation
import Firebase

class FirebaseClient {
    
    static let shared = FirebaseClient()
    
    func configure() {
        FirebaseApp.configure()
    }
    
    
    func loadModelAdapter(forPath path: String, completion: @escaping(Result<DatabaseModelAdapter, Error>) -> Void) {
        let modelRef = Database.database().reference(withPath: path)
        modelRef.observe(.value) { snapshot in
            guard let modelAdapter = snapshot.value as? DatabaseModelAdapter else {
                completion(.failure(ErrorDefinitions.snapCastMissmatch))
                return
            }
            
            completion(.success(modelAdapter))
        }
    }
}
