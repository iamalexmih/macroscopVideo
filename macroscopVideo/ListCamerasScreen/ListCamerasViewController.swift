//
//  ViewController.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import UIKit



class ListCamerasViewController: ParentViewController {
    
    var viewModel: ListCamerasViewModelProtocol!
    private let tableView = UITableView()
    private lazy var footerView = FooterView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
        observeEvent()
        loadCameras()
    }

    
    private func loadCameras() {
        viewModel.fetchCameras()
    }
    
    @objc override func restart(action: UIAlertAction) {
        viewModel.fetchCameras()
    }
    
    private func observeEvent() {
        self.viewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .startLoading:
                footerView.showLoaderIndicate()
            case .dataLoaded:
                footerView.hideLoaderIndicate()
                self.tableView.reloadData()
            case .error(let error):
                self.showErrorAlert(error)
            }
        }
    }
}



// MARK: - TableView

extension ListCamerasViewController {
    private func tableViewConfig() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CameraCell.self, forCellReuseIdentifier: CameraCell.cellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = footerView
        
        view.addSubviewAndTamic(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


// MARK: - TableView Delegate and DataSource

extension ListCamerasViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listCameras.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CameraCell.cellId, for: indexPath) as! CameraCell
        let nameCamera = viewModel.listCameras[indexPath.row].name
        cell.configureDataCell(nameCamera)
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 255
//    }

}
