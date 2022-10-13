//
//  Presenter.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

protocol HousesPresenterProtocol {
  func screenLoaded()
}

struct HousesPresenter: HousesPresenterProtocol {
    
    //MARK: Dependencies -
    private let interactor: HousesInteractor?
    private let view: HousesViewProtocol?
    
    //MARK: Initializers -
    init (_ view: HousesViewProtocol,_ interactorType: HousesInteractorType) {
        self.view = view
        self.interactor = interactorType.interactor
    }

    func screenLoaded()  {
        interactor?.getHouses { result in
            switch result {
            case .success(let items):
                view?.updateHousesUI(items)
            case .failure(let error):
                view?.showError(error: error.asAlertModel)
            }
        }
    }

}
