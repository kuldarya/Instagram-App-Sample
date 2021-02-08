//
//  AuthManager.swift
//  InstagramAppSample
//
//  Created by Darya Kuliashova on 5.02.21.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared.canCreateNewUser(username: username, email: email) { success in
            if success {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        assertionFailure("Firebase auth could not create account")
                        return
                    }
                    // Insert to Database
                    
                }
            } else {
                completion(false)
                assertionFailure("Either username or email does not exist")
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping ((Bool) -> Void)) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        } else if let username = username {
            print(username)
        }
    }
}
