//
//  NetworkClient.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import Foundation

typealias completion<T> = (Result<T, Error>) -> Void

protocol NetworkClientProtocol {
    func fetchData<T: Decodable>(_ request: UrlRequestProtocol, handler: @escaping completion<T>)
}

class NetworkClient: NetworkClientProtocol {
    private let session = URLSession.shared
    
    func fetchData<T: Decodable>(_ request: UrlRequestProtocol, handler: @escaping completion<T>) {
        guard let urlRequest = request.urlRequest else {
            //error handling
            return
        }
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                handler(.failure(error!))
                return
            }
            guard let _ = data else {
                handler(.failure(error!))
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data!)
                print(result)
                handler(.success(result))
            } catch let error {
                print(error)
                handler(.failure(error))
            }
        }
        task.resume()
    }
}

extension Data {
    var prettyString: NSString? {
        return NSString(data: self, encoding: String.Encoding.utf8.rawValue) ?? nil
    }
}
