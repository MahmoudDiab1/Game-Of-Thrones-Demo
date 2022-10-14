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
    
    private var items: [HouseTarget]?
    
    lazy var presenter: HousesPresenterProtocol = {
        return HousesPresenter(self, .remote(.urlSessionProvider))
    }()
    
    private weak var router: HousesViewControllerRouter?
    
    init(router: HousesViewControllerRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.screenLoaded()
        setupView()
    }
    
    private func setupView(){
        housesTableView.delegate = self
        housesTableView.dataSource = self
        housesTableView.register(UINib(nibName: "HousTableViewCell", bundle: nil), forCellReuseIdentifier: "HousTableViewCell")
        backgroundImageView.alpha = 0.1
        UIView.animate(withDuration: 4){
            self.backgroundImageView.alpha = 0.5
        }
    }
    
    func updateHousesUI(_ items: [HouseTarget]) {
        self.items = items
        housesTableView.reloadData()
    }
    
    func showError(error: AlertErrorModel) {
        showAlert(error)
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        if (actualPosition.y > 0){
            UIView.animate(withDuration: 1){
                self.backgroundImageView.alpha = 0.5
            }
        }else{
            UIView.animate(withDuration: 1) {
                self.backgroundImageView.alpha = 1
            }
        }
    }
}
extension HousesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HousTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HousTableViewCell,
              let items = items else{ return UITableViewCell() }
        cell.configureCell(cellModel: items[indexPath.row])
        cell.selectionStyle = .none
        cell.contentView.alpha = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let items = items else{ return }
        router?.navigateToDetailsPage(items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let delay = 0.01 * Double(indexPath.row)
        let duration =  1.0
        UIView.animate(withDuration: duration, delay: delay) {
            cell.contentView.alpha = 1
        }
    }
}
