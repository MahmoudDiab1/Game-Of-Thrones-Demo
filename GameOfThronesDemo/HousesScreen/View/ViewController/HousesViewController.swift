//
//  HousesViewController.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import UIKit 

public protocol HousesViewControllerRouter: class {
    func navigateToDetailsPage()
}
protocol HousesViewProtocol {
    func updateHousesUI(_ items: [HouseTarget])
    func showError(error: AlertErrorModel)
}

class HousesViewController: UIViewController, HousesViewProtocol {
    
    lazy var presenter: HousesPresenterProtocol = {
        return HousesPresenter(self, .remote(.urlSessionProvider))
    }()
    private weak var router: HousesViewControllerRouter?
    
    init(router: HousesViewControllerRouter ) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.screenLoaded()
        self.router?.navigateToDetailsPage()
    }
    
    func updateHousesUI(_ items: [HouseTarget]) {
        let items = items.map{print($0.name)}
    }
    
    func showError(error: AlertErrorModel) {
        print(error.message)
    }
    
}
