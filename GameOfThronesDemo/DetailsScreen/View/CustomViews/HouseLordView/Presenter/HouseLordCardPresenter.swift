//
//  HouseLordCardPresenter.swift
//  GOT
//
//  Created by Mahmoud Diab on 16/10/2022.
//

import Foundation

// MARK: Presenter -
protocol HouseLordCardPresenterProtocol{
    mutating func attach(view: HouseLordCardViewProtocol)
    func viewLoaded()
}

struct HouseLordCardPresenter: HouseLordCardPresenterProtocol {
    // MARK: Properties -
    private var view: HouseLordCardViewProtocol?
    private let interactor: HouseDetailsInteractor?
    private let housModel: HouseTarget?
    
    
    // MARK: Initializers -
    init (_ interactorType: HouseDetailesInteractorType,_ model: HouseTarget?) {
        self.interactor = interactorType.interactor
        self.housModel = model
    }
    
    
    // MARK: Functions -
    mutating func attach(view: HouseLordCardViewProtocol) {
        self.view = view
    }
    
    func viewLoaded(){
        let currentLoard = housModel?.currentLord ?? ""
        guard let currentLordUrl = URL(string: currentLoard) else {
            view?.handleEmptyLoardCard(message: "Lord isn't available")
            return
        }
        
        interactor?.getCharacter(url: currentLordUrl, completion: { result in
            switch result {
            case .success(let model):
                view?.setupLordInfo(model, housModel?.name ?? "HOUSE")
            case .failure( _):
                view?.handleEmptyLoardCard(message: "Lord isn't available")
            }
        }) 
    }
}
