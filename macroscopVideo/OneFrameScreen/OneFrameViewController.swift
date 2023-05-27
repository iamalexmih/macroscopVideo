//
//  OneFrameViewController.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 27.05.2023.
//

import UIKit



class OneFrameViewController: UIViewController {
    
    var viewModel: OneFrameViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        view.backgroundColor = .white
    }
    
    
}
