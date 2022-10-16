//
//  HouseDetailsViewController.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import UIKit 

protocol HousesDetailsViewProtocol{
    func buildswornMembersView(model: AncestralWeapons)
    func setupHeader(model: HouseDetailesCardModel)
}
class HouseDetailsViewController: UIViewController, HousesDetailsViewProtocol{ 
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var firstBtn: UIView!
    @IBOutlet weak var detailsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.styleNav()
        presenter?.screenLoaded()
        presenter?.setupView(view: self)
        
    }
    
    func buildswornMembersView(model: AncestralWeapons) {
        let swornMembersView = DetailesWithListCustomView(frame: detailsView.frame, model: model)
        swornMembersView.center = detailsView.center
        view.addSubview(swornMembersView)
    }
    
    func setupHeader(model: HouseDetailesCardModel) {
        let houseDetailesCard = HouseDetailesCard(frame: headerView.frame, model: model)
        houseDetailesCard.center = headerView.center
            view.addSubview(houseDetailesCard)
    }
    private var presenter: HousDetailsPresenterProtocol?
    private var coordinator: HousesFlow?
    init(presenter: HousDetailsPresenterProtocol, coordinator: HousDetailsFlow) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

}
