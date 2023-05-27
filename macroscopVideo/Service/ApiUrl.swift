//
//  ApiUrl.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import Foundation

enum UrlPath: String {
    case configex = "/configex"
    case mobile = "/mobile"
}

class ApiUrl {
    static func url(_ params: [String: String], path: UrlPath) -> URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "demo.macroscop.com"
        components.path = path.rawValue
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url
    }
    
    static func configexParameters() -> [String: String] {
        var parametrs: [String: String] = [:]
        parametrs["login"] = "root"
        parametrs["responsetype"] = "json"
        return parametrs
    }
    
    static func oneFrameParameters(_ cameraId: String) -> [String: String] {
        var parametrs: [String: String] = [:]
        parametrs["channelid"] = cameraId
        parametrs["login"] = "root"
        parametrs["resolutionx"] = "640"
        parametrs["resolutiony"] = "480"
        parametrs["withcontenttype"] = "true"
        parametrs["oneframeonly"] = "true"
        return parametrs
    }
}
