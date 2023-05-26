//
//  StringExtensions.swift
//  BAUIKit
//
//  Created by Hoang Anh on 18/10/2021.
//

import Foundation

public extension String {
    func isEmail() -> Bool {
        return self.contains("@") && self.contains(".")
    }
    
    func databaseKey() -> String {
        return self.replacingOccurrences(of: "@", with: "_").replacingOccurrences(of: ".", with: "_")
    }
    
    func getDataFromUrl(completion: @escaping (Data?)->()) {
        let url = URL(string: self)
        var data: Data?
        do {
            data = try? Data(contentsOf: url!)
            completion(data)
        }
    }
}

