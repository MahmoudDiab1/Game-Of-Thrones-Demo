//
//  Adapter.swift
//  GOT
//
//  Created by Mahmoud Diab on 15/10/2022.
//

import Foundation

// MARK: Target
protocol CharacterTarget {
    var name: String? { get }
    var gender: String? { get }
    var culture: String? { get }
    var aliase: String? { get } 
}

// MARK: Adapter -
struct CharacterAdapter: CharacterTarget{
    
    // MARK: Properties -
    /// Adaptee
    private let model: CharacterResponseModel?
    
    /// Target members
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
    
    
    // MARK: Initializers -
    init(_ characterResponseModel: CharacterResponseModel){
        self.model = characterResponseModel
    }
    
}


