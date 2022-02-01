//
//  APIRequest.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import Foundation

class APIRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func perform<T: Decodable>(with completion: @escaping (T?, Error?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            completion(try? decoder.decode(T.self, from: data), nil)
        }
        task.resume()
    }
}
