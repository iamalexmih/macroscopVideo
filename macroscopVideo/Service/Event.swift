//
//  Event.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import Foundation


enum Event {
    case startLoading
    case dataLoaded
    case error(ApiError?)
}
