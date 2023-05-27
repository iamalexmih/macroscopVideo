//
//  OneFrameViewModel.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 27.05.2023.
//

import Foundation


protocol OneFrameViewModelProtocol {
    var title: String { get }
    var eventHandler: ((_ event: Event) -> Void)? { get set }
    var networkService: NetworkServiceProtocol { get }
    func fetchOneFrame()
}


class OneFrameViewModel: OneFrameViewModelProtocol {
    var title = ""
    private let camera: Channels
    var eventHandler: ((Event) -> Void)?
    let networkService: NetworkServiceProtocol = NetworkService.shared
    
    init(_ camera: Channels) {
        self.camera = camera
        setTitle()
        fetchOneFrame()
    }
    
    func fetchOneFrame() {
        
    }
    
    private func setTitle() {
        title = "One frame with camera: " + camera.name
    }
}
