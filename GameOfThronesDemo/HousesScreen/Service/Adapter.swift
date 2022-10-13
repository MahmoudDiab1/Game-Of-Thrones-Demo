//
//  Adapter.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import Foundation

protocol HouseTarget {
    var name: String? { get }
}

struct HouseAdapter: HouseTarget{
    private let model: HouseModel?
    
    init(_ housResponseModel: HouseModel){
        self.model = housResponseModel
    }
    
    var name: String?{
        return model?.name
    }
}


