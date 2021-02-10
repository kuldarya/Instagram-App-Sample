//
//  NSObject+Utils.swift
//  InstagramAppSample
//
//  Created by Darya Kuliashova on 10.02.21.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
