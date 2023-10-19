//
//  FirebaseAuthManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import FirebaseAuth
import UIKit

class FirebaseAuthManager {

    func loginUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let _ = authResult?.user {
                completionBlock(true)
            } else {
                if let errorCode = error?._code {
                    if errorCode == AuthErrorCode.userNotFound.rawValue {
                        completionBlock(false)
                        return
                    }
                }
                // Other login errors
                completionBlock(false)
            }
        }
    }
}
