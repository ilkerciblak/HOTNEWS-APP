//
//  Networkable.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 17.06.2024.
//

import Foundation

protocol Networkable{
    func getRequest<T: Decodable>(with url: String, header: Dictionary<String, String>?, completionHandler: @escaping (Result<T, Error>) -> Void)
}
