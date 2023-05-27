//
//  FooterView.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 26.05.2023.
//

import UIKit

class FooterView: UIView {
    
    private var footerLabel: UILabel = {
       let label = UILabel()
        label.text = "Подгрузка данных"
        return label
    }()
    
    private var footerLoadIndicate: UIActivityIndicatorView = {
       let indicate = UIActivityIndicatorView()
        indicate.style = .large
        indicate.hidesWhenStopped = true
        return indicate
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviewAndTamic(footerLabel)
        addSubviewAndTamic(footerLoadIndicate)
        
        self.frame.size.height = 70
        
        footerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        footerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        footerLoadIndicate.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        footerLoadIndicate.topAnchor.constraint(equalTo: footerLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    
    func showLoaderIndicate() {
        footerLoadIndicate.startAnimating()
        footerLabel.text = "Подгрузка данных"
    }
    
    
    func hideLoaderIndicate() {
        footerLoadIndicate.stopAnimating()
        footerLabel.text = nil
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
