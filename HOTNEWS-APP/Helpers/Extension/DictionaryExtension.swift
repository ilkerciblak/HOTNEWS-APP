//
//  DictionaryString.swift
//  XabberSoft
//
//  Created by İlker Cıblak on 31.05.2024.
//

import Foundation

extension Dictionary{
    
    func configureUrlParameterString() -> String {
        return self.map{
            (key, value) in
            return "\(key)=\(value)"
        }.joined(separator: "&")
    }
}
