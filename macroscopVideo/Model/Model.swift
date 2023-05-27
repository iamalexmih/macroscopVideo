//
//  Model.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import Foundation

struct CamerasConfigex: Codable {
    let Channels: [Channels]?
    
    var channels: [Channels] {
        Channels ?? []
    }
}


struct Channels: Codable {
    let Id: String?
    let Name: String?
    
    var id: String {
        Id ?? ""
    }
    
    var name: String {
        Name ?? ""
    }
}
