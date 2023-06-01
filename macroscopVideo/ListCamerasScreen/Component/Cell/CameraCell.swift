//
//  CameraCell.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 26.05.2023.
//

import UIKit


final class CameraCell: UITableViewCell {
    
    static let cellId = "CameraCell"
    private let nameCamera = UILabel()
    private let imageIconCell = UIImageView()
    private let imageViewPreview = UIImageView()
    private let loadIndicate = UIActivityIndicatorView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    
    func configureDataCell(_ camera: Channels) {
        nameCamera.text = camera.name
        fetchOneFrame(camera.id)
    }
    
    
    private func fetchOneFrame(_ cameraId: String) {
        loadIndicate.startAnimating()
        NetworkService.shared.requestOneFrame(cameraId: cameraId) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let frameData):
                    self.loadIndicate.stopAnimating()
                    // вариант с помощью параметра в запросе. Его надо расскоментировать
//                    let imageFrame = UIImage(data: frameData)
                    
                    // вариант с помощью Редактирования файла.
                    guard let frameDataEdit = EditorDataService.shared.editData(frameData) else { return }
                    let imageFrame = UIImage(data: frameDataEdit)
                    
                    self.imageViewPreview.image = imageFrame
                case .failure(_):
                    self.loadIndicate.stopAnimating()
                }
            }
        }
    }
    
    
    private func configureCell() {
        selectionStyle = .none
        imageIconCell.image = UIImage(systemName: "video.circle.fill")
        imageIconCell.tintColor = .gray
        
        nameCamera.numberOfLines = 0
        
        imageViewPreview.layer.cornerRadius = 10
        imageViewPreview.clipsToBounds = true
        imageViewPreview.contentMode = .scaleAspectFill
        imageViewPreview.image = UIImage(systemName: "photo.artframe")
        imageViewPreview.tintColor = .systemGray4
        
        loadIndicate.hidesWhenStopped = true
        
        contentView.addSubviewAndTamic(nameCamera)
        contentView.addSubviewAndTamic(imageIconCell)
        contentView.addSubviewAndTamic(imageViewPreview)
        imageViewPreview.addSubviewAndTamic(loadIndicate)
        
        NSLayoutConstraint.activate([
            imageIconCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            imageIconCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageIconCell.widthAnchor.constraint(equalToConstant: 30),
            imageIconCell.heightAnchor.constraint(equalToConstant: 30),
            
            nameCamera.leadingAnchor.constraint(equalTo: imageIconCell.trailingAnchor, constant: 12),
            nameCamera.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            loadIndicate.centerXAnchor.constraint(equalTo: imageViewPreview.centerXAnchor),
            loadIndicate.centerYAnchor.constraint(equalTo: imageViewPreview.centerYAnchor),
            
            imageViewPreview.leadingAnchor.constraint(equalTo: nameCamera.trailingAnchor, constant: 12),
            imageViewPreview.widthAnchor.constraint(equalToConstant: 120),
            imageViewPreview.heightAnchor.constraint(equalTo: imageViewPreview.widthAnchor, multiplier: 0.6),
            imageViewPreview.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageViewPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
