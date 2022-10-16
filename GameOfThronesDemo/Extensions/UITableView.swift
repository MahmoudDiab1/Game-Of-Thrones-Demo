//
//  UITableView.swift
//  GOT
//
//  Created by Mahmoud Diab on 16/10/2022.
//

import UIKit

// MARK: Cell -
enum CellType: String{
    case HouseTableViewCell
    
    var id:String{
        switch self {
        case .HouseTableViewCell:
            return "HouseTableViewCell"
        }
    }
    
    var nibName: String{
        switch self {
        case .HouseTableViewCell:
            return "HouseTableViewCell"
        }
    }
}

extension UITableView {
    func registerCellNib(cell: CellType){
        self.register(UINib(nibName: cell.nibName, bundle: nil), forCellReuseIdentifier: cell.id)
    }
    
    func shouldPaginate(_ dataSourceItemsCount: Int) -> Bool {
        guard let lastVisibleCellIndex = self.indexPathsForVisibleRows?.last?.row else {return false}
        let paginationThreshold = dataSourceItemsCount-3
        return lastVisibleCellIndex >= paginationThreshold
    }
}
