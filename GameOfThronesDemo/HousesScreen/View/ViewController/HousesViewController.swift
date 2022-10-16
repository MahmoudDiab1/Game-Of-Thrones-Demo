//
//  HousesViewController.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import UIKit


// MARK: Flow -
protocol HousesFlow {
    func coordinateToHousDetails(house: HouseTarget)
}

// MARK: View -
protocol HousesViewProtocol {
    func updateHousesUI(_ houses: [HouseTarget])
    func showError(error: AlertErrorModel)
    func showActivityIndicator()
    func hideActivityIndicator()
}

// MARK: View Controller -
class HousesViewController: UIViewController{
    
    // MARK: Outlets -
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var topGOTImageView: UIImageView!
    @IBOutlet weak var housesTableView: UITableView!
    
    
    // MARK: Properties -
    private var coordinator: HousesFlow?
    private let presenter: HousesPresenter?
    private var housesList = [HouseTarget]()
    
    
    // MARK: Initializers -
    init(coordinator: HousesFlow?, presenter: HousesPresenter? ) {
        self.coordinator = coordinator
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.attach(view: self)
        presenter?.loadHouses()
    }
    
    
    // MARK: Functions -
    private func setupView(){
        setupGOTTableView()
        setupGOTImageView()
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
    }
    
    private func setupGOTTableView(){
        housesTableView.delegate = self
        housesTableView.prefetchDataSource = self
        housesTableView.dataSource = self
        housesTableView.registerCellNib(cell: .HouseTableViewCell)
    }
    
    private func setupGOTImageView() {
        topGOTImageView.alpha = 0.1
        topGOTImageView.darken()
    }
}


// MARK: Extensions -
/// View Type
extension HousesViewController: HousesViewProtocol{
    func updateHousesUI(_ houses: [HouseTarget]) {
        housesList.append(contentsOf: houses)
        housesTableView.reloadData()
    }
    
    func showError(error: AlertErrorModel) {
        showAlert(error)
    }
    
    func showActivityIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }
}

/// TableView Delegate & DataSource
extension HousesViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching { 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        housesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = CellType.HouseTableViewCell.id
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId , for: indexPath) as? HouseTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        cell.configureCell(cellModel: housesList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.coordinateToHousDetails(house: housesList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if tableView.shouldPaginate(housesList.count){
            presenter?.loadHouses()
        }
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        topGOTImageView.shine()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        topGOTImageView.darken()
    }
}
