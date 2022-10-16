//
//  HouseDetailesCard.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import UIKit

// MARK: View -
protocol HouseDetailesCardViewProtocol{
    func setupLordInfo(_ lordModel: CharacterTarget?,_ houseName: String)
    func failedToLoadCard()
    func setupEmptyView()
}

class HouseDetailesCard: UIView {
    // MARK: Outlets -
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var culturView: UIView!
    @IBOutlet weak var culture: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var lordName: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderView: UIView!
    
    
    // MARK: Properties -
    private var presenter: HouseDetailsCardPresenterProtocol?
    
    
    // MARK: Initializers -
    init(frame: CGRect,_ presenter: HouseDetailsCardPresenterProtocol?) {
        super.init(frame: frame)
        self.presenter = presenter
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    // MARK: Functions -
    private func commonInit() {
        guard let view = Bundle.main.loadNibNamed("HouseDetailesCard", owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        let _ = subviews.map{$0.removeFromSuperview()}
        addSubview(view)
        presenter?.attach(view: self)
        presenter?.viewLoaded()
        styleView()
    }
    
    private func styleView() {
        containerView.addGOTStyle()
        culturView.addGOTStyle()
        genderView.addGOTStyle()
    }
}

// MARK: Extensions -
/// View Type
extension HouseDetailesCard: HouseDetailesCardViewProtocol{
    func setupEmptyView() {
        self.subviews.map{$0.removeFromSuperview()} 
    }
    
    func setupLordInfo(_ lordModel: CharacterTarget?,_ houseName: String){
        if let gender = lordModel?.gender {
            self.gender.text = gender
        } else { genderView.isHidden = true }
        
        if let culture = lordModel?.culture {
            self.culture.text = culture
        } else { culturView.isHidden = true }
        
        lordName.text = lordModel?.name?.capitalized
        self.houseName.animate(newText: houseName, characterDelay: 0.1)
    }
    
    func failedToLoadCard() {
        // TODO: Handle Failure 
    }
}
