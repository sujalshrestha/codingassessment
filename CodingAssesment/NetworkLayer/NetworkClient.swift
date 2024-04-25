//
//  NetworkClass.swift
//  CodingAssement
//
//  Created by Macbook air on 25/04/2024.
//

import Foundation
public class NetworkClient {
        func makeCardAPICall(url: URL, completion: @escaping (Result<[CardModel], Error>) -> Void) {
            let session = URLSession.shared
            
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(NSError(domain: "Response error", code: 0, userInfo: nil)))
                    return
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(NSError(domain: "HTTP status error", code: httpResponse.statusCode, userInfo: nil)))
                    return
                }
                
                guard let responseData = data else {
                    completion(.failure(NSError(domain: "Data error", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let cardModels = try decoder.decode([CardModel].self, from: responseData)
                    completion(.success(cardModels))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
}
