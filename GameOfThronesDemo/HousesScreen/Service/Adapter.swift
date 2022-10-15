//
//  Adapter.swift
//  GameOfThronesDemo
//
//  Created by Mahmoud Diab on 13/10/2022.
//

import Foundation

protocol HouseTarget {
    var name: String? { get }
    var region: String? { get }
    var words: String? { get }
    var currentLord: String? { get }
    var founder: String? { get }
    var diedOut: String? { get }
    var title: String? { get }
    var seatst: [String]? { get }
    var cadetBranches: [String]? { get }
    var swornMembers: [String]? { get }
    var ancestralWeapons: [String]? { get}
    var url:String? {get}
}

struct HouseAdapter: HouseTarget{
    
    var words: String?{
        return model?.words
    }
    
    var currentLord: String?{
        return model?.currentLord
    }
    
    var founder: String?{
        return model?.founder
    }
    
    var diedOut: String?{
        return model?.diedOut
    }
    
    var title: String?{
        return model?.titles?.first
    }
    
    var seatst: [String]?{
        return model?.seats
    }
    
    var cadetBranchest: [String]?{
        return model?.cadetBranches
    }
    
    var swornMembers: [String]?{
        return model?.swornMembers
    }
    
    var ancestralWeapons: [String]?{
        return model?.titles
    }
    
    var name: String?{
        return model?.name
    }
    
    var region: String?{
        return model?.region
    }
    
    var cadetBranches: [String]?{
        return model?.cadetBranches
    }
    var url: String? {
        return model?.url
    }
    
    private let model: HouseModel?
    
    init(_ housResponseModel: HouseModel){
        self.model = housResponseModel
    }
}


