//
//  EmptyView.swift
//  GOT
//
//  Created by Mahmoud Diab on 17/10/2022.
//

import Foundation
import UIKit

class EmptyView: UIView{
    
    @IBOutlet weak var emptyViewMsg: UILabel!
    
    private var message: String?
    
    // MARK: Initializers -
    init(frame: CGRect,_ msg: String) {
        super.init(frame: frame)
        self.message = msg
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    // MARK: Functions -
    private func commonInit() {
        guard let view = Bundle.main.loadNibNamed("EmptyView", owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        let _ = subviews.map{$0.removeFromSuperview()}
        addSubview(view)
        setupView(message: message ?? "No data available")
    }
    
    private func setupView(message: String){
        self.emptyViewMsg.text = message
    }
}
