//
//  HousTableViewCell.swift
//  GOT
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import UIKit

class HouseTableViewCell: UITableViewCell {
    // MARK: Outlets -
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    // MARK: LifeCycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        styleCell()
    }
    
    
    // MARK: Functions -
    func configureCell(cellModel: HouseTarget){
        nameLabel.text = cellModel.name
        regionLabel.text = cellModel.region
    }
    
    private func styleCell() {
        containerView.addGOTEffectCardStyle()
    }
}
