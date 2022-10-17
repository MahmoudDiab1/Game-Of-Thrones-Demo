//
//  DetailsViewWithListPresenter.swift
//  GOT
//
//  Created by Mahmoud Diab on 16/10/2022.
//

import Foundation


protocol WeaponsListPresenterProtocol{
    mutating func attach(view: WeaponsListViewProtocol)
    func viewLoaded()
}

struct WeaponsListPresenter: WeaponsListPresenterProtocol {
     
    // MARK: Properties -
    private var view: WeaponsListViewProtocol?
    private let interactor: HouseDetailsInteractor?
    private let housModel: HouseTarget?
    
    
    // MARK: Initializers -
    init (_ interactorType: HouseDetailesInteractorType,_ model: HouseTarget?) {
        self.interactor = interactorType.interactor
        self.housModel = model
    }
    
    
    // MARK: Functions -
    mutating func attach(view: WeaponsListViewProtocol) {
        self.view = view
    }
    
    func viewLoaded(){
        
        guard let weapons = housModel?.ancestralWeapons else {
            view?.setupEmptyView(message: "This house has no weapons")
            return
        }
        let validWeapon = weapons.filter{$0 != ""}
        guard !validWeapon.isEmpty else {
            view?.setupEmptyView(message: "This house has no weapons")
            return
        }
        let model = AncestralWeapons(title: "\(validWeapon.count) Weapon", weapons: validWeapon)
        view?.setupWeaponsList(model: model)
    }
    
    
}

