//
//  WManager.swift
//  Weather
//
//  Created by Kirill Gusev on 19.03.2024.
//

import Foundation

final class WManager {
    
    static let shared = WManager()

    public func execute<T:Codable>(_ request: WRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let urlRequest = self.request(request: request) else { return }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
    private func request(request: WRequest) -> URLRequest? {
        print("🤖 Request \(request.url)")
        guard let url = URL(string: request.url) else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }
}
