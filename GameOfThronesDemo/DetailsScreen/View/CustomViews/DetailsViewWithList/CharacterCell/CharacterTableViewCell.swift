//
//  CharacterTableViewCell.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import UIKit


class CharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
     
    @IBOutlet weak var culture: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
     func configureCell(_ model: String?){ 
         nameLabel.text = model
         styleCell()
    }
    
    private func styleCell() {
        containerView.layer.cornerRadius = 12
        containerView.layer.borderColor = UIColor.orange.cgColor
        containerView.layer.borderWidth = 0.08
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
        containerView.layer.shadowRadius = 8
        containerView.layer.shadowOpacity = 1.0
        containerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        containerView.layer.masksToBounds = false
    }
    
}


