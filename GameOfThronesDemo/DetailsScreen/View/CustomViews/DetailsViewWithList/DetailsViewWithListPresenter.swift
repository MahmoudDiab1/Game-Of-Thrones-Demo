//
//  DetailsViewWithListPresenter.swift
//  GOT
//
//  Created by Mahmoud Diab on 16/10/2022.
//

import Foundation


protocol DetailsViewWithListPresenterProtocol{
    mutating func attach(view: DetailesWithListViewProtocol)
    func viewLoaded()
}

struct DetailsViewWithListPresenter: DetailsViewWithListPresenterProtocol {
     
    // MARK: Properties -
    private var view: DetailesWithListViewProtocol?
    private let interactor: HouseDetailsInteractor?
    private let housModel: HouseTarget?
    
    
    // MARK: Initializers -
    init (_ interactorType: HouseDetailesInteractorType,_ model: HouseTarget?) {
        self.interactor = interactorType.interactor
        self.housModel = model
    }
    
    
    // MARK: Functions -
    mutating func attach(view: DetailesWithListViewProtocol) {
        self.view = view
    }
    
    func viewLoaded(){
        guard let weapons = housModel?.ancestralWeapons else {return}
        let model = AncestralWeapons(title: "\(weapons.count) Weapon", weapons: weapons)
        view?.setupDetailsInfo(model: model)
    }
}

