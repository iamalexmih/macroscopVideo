//
//  UIView + ext.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 26.05.2023.
//

import UIKit

extension UIView {
    func addSubviewAndTamic(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
