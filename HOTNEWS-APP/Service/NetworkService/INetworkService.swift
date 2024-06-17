//
//  INetworkService.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 17.06.2024.
//

import Foundation

protocol INetworkService{
//    func getRequest<T: Decodable>(endpoint: String) async throws -> T
//    func getRequest<T: Decodable>(endpoint: String, completionHandler: @escaping (Result<T, NetworkError>) -> Void)
    func getRequest<T: Decodable>(with url: String, header: Dictionary<String, String>?, completionHandler: @escaping (Result<T, Error>) -> Void)
}
