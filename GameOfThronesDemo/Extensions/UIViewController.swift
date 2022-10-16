//
//  UIViewController.swift
//  GOT
//
//  Created by Mahmoud Diab on 14/10/2022.
//

import UIKit

extension UIViewController {
    func showToastMsg(_ errorMessage: String){ 
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-60, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = errorMessage
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func showAlert(_ alertErrorModel: AlertErrorModel) {
        let alert = UIAlertController(title: alertErrorModel.title,
                                      message: alertErrorModel.message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.show(alert, sender: nil)
    }
    
    
}

