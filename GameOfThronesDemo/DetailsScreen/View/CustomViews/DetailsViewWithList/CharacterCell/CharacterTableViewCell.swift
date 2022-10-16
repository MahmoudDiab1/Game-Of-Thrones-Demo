//
//  CharacterTableViewCell.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    // MARK: Outlets -
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // MARK: LifeCycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    // MARK: Functions -
    func configureCell(_ model: String?){
        nameLabel.text = model
        containerView.addGOTStyle()
    }
    
}


