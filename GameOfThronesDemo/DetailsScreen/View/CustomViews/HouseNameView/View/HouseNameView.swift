//
//  HouseNameView.swift
//  GOT
//
//  Created by Mahmoud Diab on 16/10/2022.
//

import UIKit

// MARK: View -
protocol HouseNameViewProtocol{
    func setupView(houseName: String)
}

class HouseNameView: UIView{
    // MARK: Outlets -
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    // MARK: Properties -
    private var presenter: HouseNamePresenterProtocol?
    
    
    // MARK: Initializers -
    init(frame: CGRect,_ presenter: HouseNamePresenterProtocol?) {
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
        guard let view = Bundle.main.loadNibNamed("HouseNameView", owner: self, options: nil)?.first as? UIView else { return }
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
    }
}

// MARK: Extensions -
/// View Type
extension HouseNameView: HouseNameViewProtocol{ 
    func setupView(houseName: String){
        self.houseName.animate(newText: houseName, characterDelay: 0.1)
    }
}
