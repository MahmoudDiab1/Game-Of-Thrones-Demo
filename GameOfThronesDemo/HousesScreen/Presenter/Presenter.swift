//
//  Presenter.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 12/10/2022.
//

import Foundation
import UIKit

protocol HousesPresenterProtocol {
    func screenLoaded()
    func getHouses()
    var isLoading: Bool {get set}
    func setupView(view: HousesViewProtocol)
}

class HousesPresenter: HousesPresenterProtocol {
    func setupView(view: HousesViewProtocol) {
        self.view = view
        
    }
    
    //MARK: Dependencies -
    private let interactor: HousesInteractor?
    private var view: HousesViewProtocol?
    
    //MARK: Initializers -
    init (_ interactorType: HousesInteractorType) {
        self.interactor = interactorType.interactor
    }
    
     func screenLoaded()  {
        getHouses()
    }
    
    var currentPage: Int = 0
    var isLoading: Bool = false  
     func getHouses(){
        isLoading = true
        currentPage += 1
        interactor?.getHouses(page: currentPage) { result in
            self.isLoading = false
            switch result {
            case .success(let items):
                self.view?.updateHousesUI(items)
            case .failure(let error):
                self.view?.showError(error: error.asAlertModel)
            }
        }
    }
}
