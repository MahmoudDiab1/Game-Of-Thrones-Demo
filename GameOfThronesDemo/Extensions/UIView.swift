//
//  UIView.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import UIKit

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    func addGOTStyle() {
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 0.08
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.masksToBounds = false
    }
    
    
    func addAclerycStyle() {
        self.layer.cornerRadius = 8
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.masksToBounds = false
    }
    
    func stickByconstraints(to parent: UIView){
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)])
            self.translatesAutoresizingMaskIntoConstraints = false
    }
}

