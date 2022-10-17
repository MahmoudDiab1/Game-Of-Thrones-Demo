//
//  HouseDetailsViewController.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import UIKit 

// MARK: View -
protocol HousesDetailsViewProtocol{
    func displayLordCard(_ cardPresenter: HouseLordCardPresenterProtocol)
    func displayHouseNameCard(_ cardPresenter: HouseNamePresenterProtocol)
    func displayListCard(_ cardPresenter: WeaponsListPresenterProtocol)
}

class HouseDetailsViewController: UIViewController{
    
    // MARK: Outlets -
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var rightButtonView: UIView!
    @IBOutlet weak var leftButtonView: UIView!
    
    
    // MARK: Properties -
    private var presenter: HouseDetailsPresenterProtocol?
    
    
    // MARK: Initializers -
    init(presenter: HouseDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach(view: self)
        presenter?.viewLoaded()
        setupViews()
    }
    
    
    // MARK: Functions -
    private func addSubView(subView: UIView, parent: UIView){
        self.detailsView.subviews.forEach({ $0.removeFromSuperview() })
        subView.center = parent.center
        parent.addSubview(subView)
        subView.stickByconstraints(to: parent)
    }
    
    private func setupViews(){
        navigationController?.styleNav()
        leftButtonView.addAclerycStyle()
        rightButtonView.addAclerycStyle()
        rightButtonView.layer.borderWidth = 0
        leftButtonView.layer.borderColor = UIColor.orange.cgColor
        leftButtonView.layer.borderWidth = 1
    }
    
    
    // MARK: Actions -
    @IBAction func rightButtonPressed(_ sender: Any) {
        leftButtonView.layer.borderWidth = 0
        rightButtonView.layer.borderColor = UIColor.orange.cgColor
        rightButtonView.layer.borderWidth = 1
        presenter?.weaponsBtnPressed()
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        rightButtonView.layer.borderWidth = 0
        leftButtonView.layer.borderColor = UIColor.orange.cgColor
        leftButtonView.layer.borderWidth = 1
        presenter?.lordBtnPressed()
    }
}


// MARK: Extensions -
extension HouseDetailsViewController: HousesDetailsViewProtocol{
    
    func displayLordCard(_ cardPresenter: HouseLordCardPresenterProtocol) {
        let lordCard = HouseLordCard(frame: detailsView.frame, cardPresenter)
        addSubView(subView: lordCard, parent: detailsView)
    }
    
    func displayHouseNameCard(_ cardPresenter: HouseNamePresenterProtocol) {
        let houseNameView = HouseNameView(frame: headerView.frame, cardPresenter)
        addSubView(subView: houseNameView, parent: headerView)
    }
    
    func displayListCard(_ cardPresenter: WeaponsListPresenterProtocol) {
        let weaponsCard = WeaponsListCustomView(frame: detailsView.frame, presenter: cardPresenter)
        addSubView(subView: weaponsCard, parent: detailsView)
    }
}
