//
//  Presenter.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation

// MARK: Presenter -
protocol HousesPresenterProtocol {
    func loadHouses()
    func attach(view: HousesViewProtocol)
}

class HousesPresenter: HousesPresenterProtocol {
    
    // MARK: Properties -
    private let interactor: HousesInteractor?
    private var view: HousesViewProtocol?
    private var currentPage = 0
    
    
    // MARK: Initializers -
    init (_ interactorType: HousesInteractorType) {
        self.interactor = interactorType.interactor
    }
    
    
    // MARK: Functions -
    func attach(view: HousesViewProtocol) {
        self.view = view
    }
    
    func loadHouses(){
        view?.showActivityIndicator()
        currentPage += 1
        interactor?.getHouses(page: currentPage, completion: handleLoadingHousesResult(_:))
    }
    
    private func handleLoadingHousesResult(_ result: Result<[HouseTarget], DefaultErrorModel>) {
        view?.hideActivityIndicator()
            switch result {
            case .success(let items):
                view?.updateHousesUI(items)
            case .failure(let error):
                view?.showError(error: error.asAlertModel)
            }
    }
}
