//
//  String+Utils.swift
//  InstagramAppSample
//
//  Created by Darya Kuliashova on 8.02.21.
//

import Foundation

extension String {
    func safeDatabaseKey() -> String {
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}
