//
//  ApiUrl.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import Foundation

class ApiUrl {
    static func url() -> URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "demo.macroscop.com"
        components.path = "/configex?login=root&responsetype=json"
        return components.url
    }
}
