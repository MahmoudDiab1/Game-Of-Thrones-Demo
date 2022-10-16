//
//  UILabel.swift
//  GOT
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import UIKit

extension UILabel {

    func animate(newText: String, characterDelay: TimeInterval) {
        DispatchQueue.main.async {
            self.text = ""
            for (index, character) in newText.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + characterDelay * Double(index)) {
                    self.text?.append(character)
                }
            }
        }
    }

}
