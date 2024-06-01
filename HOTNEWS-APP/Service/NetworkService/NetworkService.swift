//
//  NetworkService.swift
//  XabberSoft
//
//  Created by İlker Cıblak on 22.05.2024.
//

import Foundation

class NetworkService{
    
    static let shared = NetworkService()
    
    func fetchData<T: Decodable>(with url: String, header: Dictionary<String, String>? = nil, completionHandler: @escaping (Result<T, Error>) -> Void){
        
        guard let url = URL(string: url) else {
            print("Url pattern is wrong with:\(url)")
            
            return
        }
        
        var urlRequest =  URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = header
        print(url)
        let task = URLSession.shared.dataTask(with: urlRequest){
            (data, response, error) in
            
            guard error == nil else {
                completionHandler(.failure(error!))
                print("Networks Service Layer error: \(error!)")
                return
            }
            
            if let safeData = data {
                do{
                    let decoded = try JSONDecoder().decode(T.self, from: safeData)
                    
                    completionHandler(.success(decoded))
                }catch let decodingError{
                    print("Decoding Error @fetchData with:\(decodingError)")
                    completionHandler(.failure(decodingError))
                }
            }
        }
        
        task.resume()
        
    }
}

