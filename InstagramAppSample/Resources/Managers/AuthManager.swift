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
    
    public func registerNewUser(email: String, username: String, password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        // Firebase auth could not create account
                        completion(false)
                        return
                    }
                    // Insert to Database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            // Failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                completion(false)
            }
        }
    }
    
    public func loginUser(email: String?, username: String?, password: String, completion: @escaping ((Bool) -> Void)) {
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
    
    public func logOut(completion: (Bool) -> ()) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            assertionFailure(error.localizedDescription)
            completion(false)
            return
        }
    }
}
