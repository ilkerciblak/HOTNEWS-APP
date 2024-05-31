//
//  StringExtension.swift
//  XabberSoft
//
//  Created by İlker Cıblak on 31.05.2024.
//

import Foundation

extension String{
    func configureUrlString(endPoint:String,parameters:Dictionary<String, String>? = nil) -> String{
        let baseUrl = self.trimmingCharacters(in: [" "])
        let endPoint = endPoint.trimmingCharacters(in: [" "])
        return "\(baseUrl)\(endPoint)\(parameters?.configureUrlParameterString() ?? "")"
    }
    
    
    func getFirstCaseCapilitialized() -> String {
        return lowercased().prefix(1).uppercased() + lowercased().dropFirst()
    }
}


