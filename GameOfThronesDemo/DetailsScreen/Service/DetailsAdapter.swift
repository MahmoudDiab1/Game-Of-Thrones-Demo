//
//  Adapter.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation

protocol CharacterTarget {
    var name: String? { get }
    var gender: String? { get }
    var culture: String? { get }
    var aliase: String? { get } 
}

struct CharacterAdapter: CharacterTarget{
    var name: String?{
        return model?.name
    }
    
    var gender: String?{
        return model?.gender
    }
    
    var culture: String?{
        return model?.culture
    }
    
    var aliase: String?{
        return model?.aliases?.first
    }
    
    
    
    private let model: CharacterResponseModel?
    
    init(_ characterResponseModel: CharacterResponseModel){
        self.model = characterResponseModel
    }
}


