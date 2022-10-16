//
//  Sowrns.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation
import UIKit


struct AncestralWeapons{
    var weapons:[String]?
}


class DetailesWithListCustomView: UIView{ 
    
    @IBOutlet weak var list: UITableView!
    @IBOutlet weak var title: UILabel!
    
    private var model: AncestralWeapons?
    
    
    init(frame: CGRect, model: AncestralWeapons?) {
        super.init(frame: frame)
        self.model = model
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = Bundle.main.loadNibNamed("DetailesWithListCustomView", owner: self, options: nil)?.first as? UIView else { return }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        for view in self.subviews {
            view.removeFromSuperview()
        }
        
        addSubview(view)
        list.register(UINib(nibName: "CharacterTableViewCell", bundle: nil), forCellReuseIdentifier: "CharacterTableViewCell")
        list.dataSource = self
        title.text = "DDDD"
    } 
    
    
}

extension DetailesWithListCustomView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.weapons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
        cell.configureCell(model?.weapons?[indexPath.row])
        return cell
    }
    
}
