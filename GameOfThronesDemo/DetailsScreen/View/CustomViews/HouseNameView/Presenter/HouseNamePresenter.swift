//
//  Presenter.swift
//  GOT
//
//  Created by Mahmoud Diab on 16/10/2022.
//

// MARK: Presenter -
protocol HouseNamePresenterProtocol{
    mutating func attach(view: HouseNameViewProtocol)
    func viewLoaded()
}

struct HouseNamePresenter: HouseNamePresenterProtocol {
    // MARK: Properties -
    private var view: HouseNameViewProtocol?
    private let housModel: HouseTarget?
    
    // MARK: Initializers -
    init (_ model: HouseTarget?) {
        self.housModel = model
    }
    
    
    // MARK: Functions -
    mutating func attach(view: HouseNameViewProtocol) {
        self.view = view
    }
    
    func viewLoaded(){
        view?.setupView(houseName: housModel?.name ?? "HOUSE")
    }
    
}
