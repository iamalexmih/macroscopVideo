//
//  OneFrameViewController.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 27.05.2023.
//

import UIKit



class OneFrameViewController: UIViewController {
    
    var viewModel: OneFrameViewModelProtocol!
    
    private let imageOneFrame = UIImageView()
    private let containerView = UIView()
    private let loadIndicate = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUiElements()
        configureLayout()
        observeEvent()
        loadOneFrame()
    }
    
    
    private func loadOneFrame() {
        viewModel.fetchOneFrame()
    }
    
    
    private func observeEvent() {
        self.viewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .startLoading:
                self.loadIndicate.startAnimating()
            case .dataLoaded:
                self.loadIndicate.stopAnimating()
                self.setFrame()
            case .error(let error):
                showErrorAlert(error) {
                    self.loadOneFrame()
                }
            }
        }
    }
}


// MARK: - Configure UI

extension OneFrameViewController {
    
    private func setFrame() {
        guard let oneFrame = viewModel.oneFrame else { return }
        let image = UIImage(data: oneFrame)
        guard let image = image else { return }
        imageOneFrame.image = image
    }
    
    private func configureUiElements() {
        title = viewModel.title
        view.backgroundColor = .white
        
        loadIndicate.style = .large
        loadIndicate.hidesWhenStopped = true
        
        imageOneFrame.backgroundColor = .systemGray6
        imageOneFrame.layer.cornerRadius = 15
        imageOneFrame.contentMode = .scaleAspectFill
        imageOneFrame.layer.masksToBounds = true
        imageOneFrame.image = UIImage(systemName: "photo.artframe")
        imageOneFrame.tintColor = .systemGray4
    }
    
    private func configureLayout() {
        view.addSubviewAndTamic(containerView)
        containerView.addSubviewAndTamic(imageOneFrame)
        containerView.addSubviewAndTamic(loadIndicate)
        
        NSLayoutConstraint.activate([
            loadIndicate.topAnchor.constraint(equalTo: containerView.topAnchor),
            loadIndicate.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            loadIndicate.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            loadIndicate.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
            containerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3.5),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageOneFrame.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageOneFrame.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageOneFrame.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageOneFrame.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
