//
//  HouseDetailesCard.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import UIKit

struct HouseDetailesCardModel{
var lord: CharacterTarget?
var houseName:String
}

class HouseDetailesCard: UIView {
    
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var culturView: UIView!
    @IBOutlet weak var culture: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var genderView: UIView!
    
    private var model: HouseDetailesCardModel?
    
    init(frame: CGRect, model: HouseDetailesCardModel?) {
        super.init(frame: frame)
        self.model = model
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = Bundle.main.loadNibNamed("HouseDetailesCard", owner: self, options: nil)?.first as? UIView else { return }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        for view in self.subviews {
            view.removeFromSuperview()
        }
        addSubview(view)
        
        gender.text = model?.lord?.gender 
        culture.text = model?.lord?.culture
        nickName.text = model?.lord?.name?.capitalized
        houseName.animate(newText: model?.houseName ?? "LORD", characterDelay: 0.1)
        styleCell()
    }
    
    
    
    
    private func styleCell() {
        containerView.addGOTEffectShadow()
        culturView.addGOTEffectShadow()
        genderView.addGOTEffectShadow()
    }
    
}

extension UIView{
    func addGOTEffectShadow() {
        self.layer.cornerRadius = 12
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 0.08
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.masksToBounds = false
    }
}
 
