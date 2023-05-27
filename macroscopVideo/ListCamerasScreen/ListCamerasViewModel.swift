//
//  ListCamerasViewModel.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 25.05.2023.
//

import Foundation

protocol ListCamerasViewModelProtocol {
    var listCameras: [Channels] { get }
    var eventHandler: ((_ event: Event) -> Void)? { get set }
    var networkService: NetworkServiceProtocol { get }
    func fetchCameras()
}


class ListCamerasViewModel: ListCamerasViewModelProtocol {
    
    let networkService: NetworkServiceProtocol = NetworkService.shared
    var listCameras: [Channels] = []
    var eventHandler: ((Event) -> Void)?
    
    
    func fetchCameras() {
        eventHandler?(.startLoading)
        networkService.request { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let listCameras):
                self.listCameras = listCameras.channels
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}
