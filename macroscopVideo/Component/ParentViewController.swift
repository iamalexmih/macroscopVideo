//
//  ParentViewController.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 26.05.2023.
//

import UIKit

class ParentViewController: UIViewController {
    
    let topView = UIView()
    private let titleLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTitle()
    }
    
    
    func showErrorAlert(_ error: ApiError?) {
        guard let error = error else { return }
        let message = "\(error.description)."
        let action = UIAlertAction(title: "Restart",
                                   style: .default,
                                   handler: restart)
        let alertLogOut = UIAlertController(title: "Oops",
                                            message: message,
                                            preferredStyle: .alert)
        alertLogOut.addAction(action)
        present(alertLogOut, animated: true)
    }
    
    
    @objc func restart(action: UIAlertAction) { }
    
    
    private func configTitle() {
        view.addSubviewAndTamic(topView)
        topView.addSubviewAndTamic(titleLabel)
        
        topView.backgroundColor = .white
        
        titleLabel.text = "Список камер"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .systemGray
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            
            topView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        ])
    }
}
