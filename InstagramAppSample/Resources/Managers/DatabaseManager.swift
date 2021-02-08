//
//  DatabaseManager.swift
//  InstagramAppSample
//
//  Created by Darya Kuliashova on 5.02.21.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    /// Check if username and email are available
    /// - Parameters:
    ///     - username: String representing username
    ///     - email: String representing email
    public func canCreateNewUser(username: String, email: String, completion: (Bool) -> Void) {
        
    }
    
    /// Inserts new user to database
    /// - Parameters:
    ///     - username: String representing username
    ///     - email: String representing email
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email).setValue(["username" : username]) { error, _ in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
