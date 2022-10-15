//
//  HousesViewController.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import UIKit
//
//  HousesViewController.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//
import UIKit
import CoreMedia

protocol HousesViewControllerRouter: class {
    func navigateToDetailsPage(_ housModel: HouseTarget)
}

protocol HousesViewProtocol {
    func updateHousesUI(_ items: [HouseTarget])
    func showError(error: AlertErrorModel)
}

class HousesViewController: UIViewController, HousesViewProtocol{
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var housesTableView: UITableView!
    
    private var coordinator: HousesFlow?
    private let presenter: HousesPresenterProtocol?
    
    private var items = [HouseTarget]()
    init( coordinator: HousesFlow?, presenter: HousesPresenterProtocol? ) {
        self.coordinator = coordinator
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.screenLoaded()
        presenter?.setupView(view: self)
        setupView()
    }
    
    private func setupView(){
        housesTableView.delegate = self
        housesTableView.dataSource = self
        housesTableView.register(UINib(nibName: "HouseTableViewCell", bundle: nil), forCellReuseIdentifier: "HouseTableViewCell")
        backgroundImageView.alpha = 0.1
        UIView.animate(withDuration: 4){
            self.backgroundImageView.alpha = 0.5
        }
    }
    
    func updateHousesUI(_ items: [HouseTarget]) {
        self.items.append(contentsOf: items)
        housesTableView.reloadData()
    }
    
    func showError(error: AlertErrorModel) {
        showAlert(error)
    }
    
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 2) {
            self.backgroundImageView.alpha = 1
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > housesTableView.contentSize.height-100-scrollView.frame.size.height{
            presenter?.getHouses()
        }
        UIView.animate(withDuration: 2){
            self.backgroundImageView.alpha = 0.4
        }
    }
}
extension HousesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HouseTableViewCell else{return UITableViewCell()}
        cell.configureCell(cellModel: items[indexPath.row])
        cell.selectionStyle = .none
        cell.contentView.alpha = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.coordinateToHousDetails(house: items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let delay = 0.01 * Double(indexPath.row)
        let duration = 0.5
        UIView.animate(withDuration: duration, delay: delay) {
            cell.contentView.alpha = 1
        }
    }
}
