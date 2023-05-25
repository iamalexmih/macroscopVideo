//
//  Model.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import Foundation

struct Camera: Codable {
    let Channels: [Channels]?
}


struct Channels: Codable {
    let Id: String
}
