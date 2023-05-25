//
//  NetworkService.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import Foundation


protocol NetworkServiceProtocol: AnyObject {
    func request(completion: @escaping (Result<Camera, ApiError>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func request(completion: @escaping (Result<Camera, ApiError>) -> Void) {
//        let url = ApiUrl.url()
        let url = URL(string: "http://demo.macroscop.com/configex?login=root&responsetype=json")
        performRequest(with: url, type: Camera.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let data):
                    completion(.success(data))
                }
            }
        }
    }
    
    func requestOneFrame(completion: @escaping (Result<Data, ApiError>) -> Void) {
        let url = URL(string: "http://demo.macroscop.com/mobile?&channelid=773bad89-c18a-4e7e-a70d-c2a37897a92d&login=root&resolutionx=640&resolutiony=480&withcontenttype=true&oneframeonly=true")
    
        
        guard let url = url else {
            completion(.failure(.urlNotCreate))
            return
        }
        
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard error == nil else {
                completion(.failure(.internetConnectionLost))
                return
            }
            if let response = response as? HTTPURLResponse,
                      !(200...299).contains(response.statusCode) {
                completion(.failure(.badResponse(response: response, statusCode: response.statusCode)))
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }

    
    
    private func performRequest<T: Decodable>(with url: URL?,
                                              type: T.Type,
                                              completion: @escaping (Result<T, ApiError>) -> Void) {
        guard let url = url else {
            completion(.failure(.urlNotCreate))
            return
        }
        
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard error == nil else {
                completion(.failure(.internetConnectionLost))
                return
            }
            if let response = response as? HTTPURLResponse,
                      !(200...299).contains(response.statusCode) {
                completion(.failure(.badResponse(response: response, statusCode: response.statusCode)))
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                if let decodedData = try? JSONDecoder().decode(type.self, from: data) {
                    completion(.success(decodedData))
                } else {
                    completion(.failure(.decodeError))
                }
            }
        }
        task.resume()
    }
}


