//
//  UINavigationController.swift
//  GOT
//
//  Created by Mahmoud Diab on 17/10/2022.
//

import UIKit

extension UINavigationController {
    
    func makeNavTransparent() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = .clear
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationBar.titleTextAttributes = textAttributes
        self.navigationBar.tintColor = UIColor.black
    }
    
    func unTransperentNav() {
        self.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationBar.shadowImage = nil
        styleNav()
    }
    
    func removeBottomNavBarLine() {
        self.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage(named: "")
    }
    func styleNav () {
        removeBottomNavBarLine()
        self.navigationBar.barTintColor = .darkGray
        self.navigationBar.tintColor = UIColor.white
        let backButton = UIBarButtonItem()
        backButton.title = "HOUSES"
        self.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
