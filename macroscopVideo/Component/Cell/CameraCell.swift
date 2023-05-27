//
//  CameraCell.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 26.05.2023.
//

import UIKit



class CameraCell: UITableViewCell {
    
    static let cellId = "CameraCell"
    private let nameCamera = UILabel()
    private let imageCamera = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    
    func configureDataCell(_ nameCamera: String) {
        self.nameCamera.text = nameCamera
    }
    
    
    private func configureCell() {
        selectionStyle = .none
        
        imageCamera.image = UIImage(systemName: "video.circle.fill")
        imageCamera.tintColor = .gray
        
        contentView.addSubviewAndTamic(nameCamera)
        contentView.addSubviewAndTamic(imageCamera)
        
        NSLayoutConstraint.activate([
            imageCamera.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            imageCamera.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageCamera.widthAnchor.constraint(equalToConstant: 30),
            imageCamera.heightAnchor.constraint(equalToConstant: 30),
            
            nameCamera.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameCamera.leadingAnchor.constraint(equalTo: imageCamera.trailingAnchor, constant: 12),
            nameCamera.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            nameCamera.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
