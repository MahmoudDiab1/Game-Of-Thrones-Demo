//
//  HousDetailsPresenter.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation

protocol HousDetailsPresenterProtocol{
    func screenLoaded()
    func setupView(view: HousesDetailsViewProtocol)
}

class HousDetailsPresenter: HousDetailsPresenterProtocol{
    
    //MARK: Dependencies -
    private let interactor: HouseDetailsInteractor?
    private var view: HousesDetailsViewProtocol?
    private let housModel: HouseTarget?
    
    //MARK: Initializers -
    init (_ interactorType: HouseDetailesInteractorType, model: HouseTarget?) {
        self.interactor = interactorType.interactor
        self.housModel = model
    }
    
    func setupView(view: HousesDetailsViewProtocol) {
        self.view = view
    }
    
    func screenLoaded(){
        guard let currentLordUrl = housModel?.currentLord, currentLordUrl != "" else{
            return
        }
        interactor?.getCharacter(url:currentLordUrl){ result in
            switch result {
            case .success(let model):
                self.view?.setupHeader(model: HouseDetailesCardModel(lord: model, houseName: self.housModel?.name ?? ""))
                
                self.view?.buildswornMembersView(model: AncestralWeapons(weapons: self.housModel?.ancestralWeapons))
            case .failure(let error):
                print("")
            }
        }
    }
    
    
    
}

