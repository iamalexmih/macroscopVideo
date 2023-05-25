//
//  ApiError.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import Foundation


enum ApiError: Error {
    case urlNotCreate
    case internetConnectionLost
    case dataError
    case decodeError
    case badResponse(response: HTTPURLResponse, statusCode: Int)

    
    var description: String {
        switch self {
        case .urlNotCreate:
            return "URL не создан"
        case .internetConnectionLost:
            return "Проверьте интернет соединение"
        case .dataError:
            return "Что-то не так с данными"
        case .decodeError:
            return "Ошибка при декодировании данных"
        case .badResponse(response: let response, statusCode: let statusCode):
            return responseMessage(for: response, with: statusCode)
        }
    }
    
    private func responseMessage(for response: HTTPURLResponse, with statusCode: Int) -> String {
        switch statusCode {
        case 401:
            return "Ошибка авторизации: \(statusCode)"
        case 500:
            return "Все упало: \(statusCode)"
        default:
            return "Плохой ответ сервера: \(response)"
        }
    }
}
