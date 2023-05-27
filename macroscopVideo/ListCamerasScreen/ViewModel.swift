//
//  ViewModel.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 25.05.2023.
//

import Foundation

protocol ListCamerasViewModelProtocol {
    var listCameras: [Channels] { get }
    var eventHandler: ((_ event: Event) -> Void)? { get set }
    
    init(networkService: NetworkServiceProtocol)
    func fetchCameras()
}


class ListCamerasViewModel: ListCamerasViewModelProtocol {
    
    let networkService: NetworkServiceProtocol
    var listCameras: [Channels] = []
    var eventHandler: ((Event) -> Void)?
    
    required init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
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
