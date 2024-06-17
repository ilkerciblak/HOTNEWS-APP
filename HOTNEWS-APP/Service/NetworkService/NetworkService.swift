//
//  NetworkService.swift
//  XabberSoft
//
//  Created by İlker Cıblak on 22.05.2024.
//

import Foundation

class NetworkService: Networkable{
    
    static let shared = NetworkService()
    
    
    func getRequest<T: Decodable>(with url: String, header: Dictionary<String, String>? = nil, completionHandler: @escaping (Result<T, Error>) -> Void){
        guard let url = URL(string: url) else {
            completionHandler(.failure(NetworkError.invalidUrl))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = header
        urlRequest.httpMethod = HttpMethod.get.rawValue
        
        let task = URLSession.shared.dataTask(with: urlRequest){
            (rawData, response, error) in
            
            guard error == nil else {
                completionHandler(.failure(NetworkError.unknown))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completionHandler(.failure(NetworkError.badResponseCode))
                return
            }
            
            guard let safeData = rawData else {
                completionHandler(.failure(NetworkError.unknown))
                return
            }
            
            guard let decodedData = try? JSONDecoder().decode(T.self, from: safeData) else {
                completionHandler(.failure(NetworkError.decodeError))
                return
            }
            
            completionHandler(.success(decodedData))
            
        }
        
        task.resume()
    }
    
    
    
    
}
