//
//  ViewController.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import UIKit
import AVFoundation
import AVKit


class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let networkService = NetworkService()
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
//        networkService.request { result in
//            switch result {
//            case .success(let success):
//                print(success.Channels?[0].Id)
//                self.networkService.requestOneFrame { resultFrame in
//                    switch resultFrame {
//                    case .success(let success):
//                        print(success)
//                        let image = UIImage(data: success)
//                        guard let image = image else {
//                            print("картинку не извлеч")
//                            return
//                        }
//                        DispatchQueue.main.async {
//                           self.imageView.image = image
//                        }
//                    case .failure(let failure):
//                        print("Error Error Error", failure.description)
//                    }
//                }
//            case .failure(let failure):
//                print("Error Error Error", failure.description)
//            }
//        }
    }

}



extension ViewController {
//    func video() {
//        guard let videoURL = URL(string: "http://demo.macroscop.com/mobile?&channelid=773bad89-c18a-4e7e-a70d-c2a37897a92d&login=root&resolutionx=640&resolutiony=480&withcontenttype=true") else {
//            print("Неверный URL-адрес видео")
//            return
//        }
//
//        // Создание экземпляра AVPlayer с использованием URL-адреса видео
//        let player = AVPlayer(url: videoURL)
//
//        // Создание экземпляра AVPlayerLayer для отображения видео
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = myView.frame
//        myView.layer.addSublayer(playerLayer)
//
//        // Воспроизведение потокового видео
//        player.play()
//    }
//
//
//
//    func startVideo() {
//        let url = URL(string: "http://demo.macroscop.com/mobile?&channelid=773bad89-c18a-4e7e-a70d-c2a37897a92d&login=root&resolutionx=640&resolutiony=480&withcontenttype=true")
//        player = AVPlayer (url: url!)
//        avpController.player = player
//        avpController.view.frame.size.height = myView.frame.size.height
//        avpController.view.frame.size.width = myView.frame.size.width
//        self.myView.addSubview(avpController.view)
//        player.play()
//    }
    
    
}
