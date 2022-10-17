//
//  HousDetailsPresenter.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation

// MARK: Presenter -
protocol HouseDetailsPresenterProtocol{
    func viewLoaded()
    mutating func attach(view: HousesDetailsViewProtocol)
    func weaponsBtnPressed()
    func lordBtnPressed()
}

struct HouseDetailsPresenter: HouseDetailsPresenterProtocol{
    //MARK: Properties -
    private let interactor: HouseDetailsInteractor?
    private var view: HousesDetailsViewProtocol?
    private let housModel: HouseTarget?
    
    
    //MARK: Initializers -
    init (_ interactorType: HouseDetailesInteractorType, model: HouseTarget?) {
        self.interactor = interactorType.interactor
        self.housModel = model
    }
    
    
    // MARK: Functions -
    mutating func attach(view: HousesDetailsViewProtocol) {
        self.view = view
    }
    
    func viewLoaded(){
        let presenter = HouseNamePresenter(housModel)
        view?.displayHouseNameCard(presenter)
        lordBtnPressed()
    }
    
    func weaponsBtnPressed() {
        let weaponsPresenter = WeaponsListPresenter(.remote(.urlSessionProvider), housModel)
        view?.displayListCard(weaponsPresenter)
    }
    
    func lordBtnPressed() {
        let remote: HouseDetailesInteractorType = .remote(.urlSessionProvider)
        let lordCardPresenter = HouseLordCardPresenter(remote, housModel)
        view?.displayLordCard(lordCardPresenter)
    }
}

