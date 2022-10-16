//
//  UIImageView.swift
//  GOT
//
//  Created by Mahmoud Diab on 16/10/2022.
//

import UIKit

extension UIImageView{
    func darken(){
        UIView.animate(withDuration: 2){
            self.alpha = 0.4
        }
    }
    
    func shine(){
        UIView.animate(withDuration: 2) {
            self.alpha = 1
        }
    }
}
