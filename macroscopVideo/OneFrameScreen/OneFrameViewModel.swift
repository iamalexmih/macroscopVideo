//
//  OneFrameViewModel.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 27.05.2023.
//

import Foundation


protocol OneFrameViewModelProtocol {
    var title: String { get }
    var oneFrame: Data? { get }
    var eventHandler: ((_ event: Event) -> Void)? { get set }
    var networkService: NetworkServiceProtocol { get }
    func fetchOneFrame()
}


final class OneFrameViewModel: OneFrameViewModelProtocol {
    var title = ""
    private let camera: Channels
    var oneFrame: Data?
    var eventHandler: ((Event) -> Void)?
    let networkService: NetworkServiceProtocol = NetworkService.shared
    
    init(_ camera: Channels) {
        self.camera = camera
        setTitle()
    }
    
    func fetchOneFrame() {
        eventHandler?(.startLoading)
        networkService.requestOneFrame(cameraId: camera.id) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let frameData):
                    self.oneFrame = frameData
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
            }
        }
    }
    
    private func setTitle() {
        title = "One frame with camera: " + camera.name
    }
}
