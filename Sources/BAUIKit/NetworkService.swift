//
//  NetworkService.swift
//  RestaurantApp
//
//  Created by Hoang Anh on 02/04/2021.
//

import Foundation

struct Constant {
    struct API {
        static let baseUrl = "https://api.unsplash.com"
        static let access_key = "9L8AcpvozWiW0rbd3BxO8H49e3qNtaQk0IWc_KUakqc"
    }
}

class APIRequest {
    var method: HttpMethod
    var path: String
    var urlParameters: [URLQueryItem]
    
    init(method: HttpMethod, path: String, urlParameters: [URLQueryItem]) {
        self.method = method
        self.path = path
        self.urlParameters = urlParameters
    }
}

extension APIRequest {
    var urlComponent: URLComponents {
        var urlComponent = URLComponents(string: Constant.API.baseUrl)
        urlComponent?.path = path
        urlComponent?.queryItems = urlParameters
        
        return urlComponent!
    }
    
    var request: URLRequest? {
        guard let url: URL = urlComponent.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return URLRequest(url: urlComponent.url!)
    }
}

enum HttpMethod: String {
    case GET, POST, PUT
}

enum Either<T> {
    case success(T)
    case error(APIError)
}

enum APIError: Error {
    case unknown, badResponse, jsonDecoder, imageDownload, imageConvert, urlWrong
}

protocol API {
    func get<T: Codable>(with request: URLRequest, completion: @escaping (Either<T>) -> ())
}


extension API {
    func get<T: Codable>(with request: URLRequest, completion: @escaping (Either<T>) -> ()) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.error(.urlWrong))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(.error(.badResponse))
                return
            }
            
            guard let data = try? JSONDecoder().decode(T.self, from: data!) else {
                completion(.error(.jsonDecoder))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}

