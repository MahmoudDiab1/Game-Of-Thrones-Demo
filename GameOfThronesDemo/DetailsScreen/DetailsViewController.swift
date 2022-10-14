//
//  DetailsViewController.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import UIKit

protocol DetailsRouter: class {
    func navigateBackToMasterView(detailsCoordinator: DetailsCoordinator)
    
}

class DetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    private weak var router: DetailsRouter?
    
    init(router: DetailsRouter) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
