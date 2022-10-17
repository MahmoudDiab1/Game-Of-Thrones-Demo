//
//  Sowrns.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation
import UIKit

// MARK: View -
protocol WeaponsListViewProtocol{
    func setupWeaponsList(model: AncestralWeapons)
    func setupEmptyView()
}

class WeaponsListCustomView: UIView, WeaponsListViewProtocol{ 
    
    // MARK: Outlets -
    @IBOutlet weak var list: UITableView!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    // MARK: Properties -
    private var presenter: WeaponsListPresenterProtocol?
    private var weapons = [String]()
    
    
    // MARK: Initializers -
    init(frame: CGRect, presenter: WeaponsListPresenterProtocol?) {
        super.init(frame: frame)
        self.presenter = presenter
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    // MARK: Functions -
    private func commonInit() {
        guard let view = Bundle.main.loadNibNamed("WeaponsListCustomView", owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        for view in self.subviews {
            view.removeFromSuperview()
        }
        addSubview(view)
        presenter?.attach(view: self)
        presenter?.viewLoaded()
        list.registerCellNib(cell: .weaponCell)
        list.dataSource = self
        containerView.addGOTStyle()
    }
    
    func setupWeaponsList(model: AncestralWeapons) {
        title.text = model.title
        weapons.append(contentsOf: model.weapons ?? [])
        list.reloadData()
    }
    
    func setupEmptyView() {
        let _ = self.subviews.map{$0.removeFromSuperview()}
    }
}


// MARK: Extensions -
extension WeaponsListCustomView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weapons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = CellType.weaponCell.id
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? WeaponTableViewCell
        guard let cell = cell else {return UITableViewCell()}
        cell.configureCell(weapons[indexPath.row])
        return cell
    }
    
}
