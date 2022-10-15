//
//  HousTableViewCell.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import UIKit

class HouseTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        styleCell()
    }
    
     func configureCell(cellModel: HouseTarget){
         nameLabel.text = cellModel.name
         regionLabel.text = cellModel.region
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
