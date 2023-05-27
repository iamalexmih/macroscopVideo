//
//  UIviewController + ext.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 27.05.2023.
//

import UIKit

extension UIViewController {
    func showErrorAlert(_ error: ApiError?, restart: @escaping() -> Void) {
        guard let error = error else { return }
        let message = "\(error.description)."
        let action = UIAlertAction(title: "Restart",
                                   style: .default) { _ in
            restart()
        }
        let alertLogOut = UIAlertController(title: "Oops",
                                            message: message,
                                            preferredStyle: .alert)
        alertLogOut.addAction(action)
        present(alertLogOut, animated: true)
    }
}
