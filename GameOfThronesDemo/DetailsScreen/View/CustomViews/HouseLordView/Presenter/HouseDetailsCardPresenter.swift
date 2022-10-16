//
//  HouseDetailsCardPresenter.swift
//  GOT
//
//  Created by Mahmoud Diab on 16/10/2022.
//

import Foundation

// MARK: Presenter -
protocol HouseDetailsCardPresenterProtocol{
    mutating func attach(view: HouseDetailesCardViewProtocol)
    func viewLoaded()
}

struct HouseDetailsCardPresenter: HouseDetailsCardPresenterProtocol {
    // MARK: Properties -
    private var view: HouseDetailesCardViewProtocol?
    private let interactor: HouseDetailsInteractor?
    private let housModel: HouseTarget?
    
    
    // MARK: Initializers -
    init (_ interactorType: HouseDetailesInteractorType,_ model: HouseTarget?) {
        self.interactor = interactorType.interactor
        self.housModel = model
    }
    
    
    // MARK: Functions -
    mutating func attach(view: HouseDetailesCardViewProtocol) {
        self.view = view
    }
    
    func viewLoaded(){
        let currentLoard = housModel?.currentLord ?? ""
        guard let currentLordUrl = URL(string: currentLoard) else {
            view?.setupEmptyView()
            return
        }
        
        interactor?.getCharacter(url: currentLordUrl, completion: { result in
            switch result {
            case .success(let model):
                view?.setupLordInfo(model, housModel?.name ?? "HOUSE")
            case .failure( _):
                view?.failedToLoadCard()
            }
        }) 
    }
}
