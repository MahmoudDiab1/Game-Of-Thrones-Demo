//
//  HouseDetailesCard.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import UIKit

// MARK: View -
protocol HouseLordCardViewProtocol{
    func setupLordInfo(_ lordModel: CharacterTarget?,_ houseName: String)
    func handleEmptyLoardCard(message: String)
}

class HouseLordCard: UIView {
    // MARK: Outlets -
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var culturView: UIView!
    @IBOutlet weak var culture: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var lordName: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderView: UIView!
    
    
    // MARK: Properties -
    private var presenter: HouseLordCardPresenterProtocol?
    
    
    // MARK: Initializers -
    init(frame: CGRect,_ presenter: HouseLordCardPresenterProtocol?) {
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
        guard let view = Bundle.main.loadNibNamed("HouseLordCard", owner: self, options: nil)?.first as? UIView else { return }
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
        culturView.addAclerycStyle()
        genderView.addAclerycStyle()
        backgroundImageView.layer.cornerRadius = 12
    }
}

// MARK: Extensions -
/// View Type
extension HouseLordCard: HouseLordCardViewProtocol{
    
    func setupLordInfo(_ lordModel: CharacterTarget?,_ houseName: String){
        if let gender = lordModel?.gender, gender != "" {
            self.gender.text = gender
        } else { genderView.isHidden = true }
        
        if let culture = lordModel?.culture, culture != "" {
            self.culture.text = culture
        } else { culturView.isHidden = true }
        
        lordName.text = lordModel?.name?.capitalized
        self.houseName.animate(newText: houseName, characterDelay: 0.1)
    }
    
    func handleEmptyLoardCard(message: String) {
        setupEmptyView(message: message)
    }
}
