//
//  Country.swift
//  Networking-Router
//
//  Created by Dushan Saputhanthri on 23/2/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

struct Country: Codable, CodableInit {
    
    var name: String?
    var capital: String?
    var states: [State]?

    public init(name: String?, capital: String?, states: [State]?) {
        self.name = name
        self.capital = capital
        self.states = states
    }

    public enum CodingKeys: String, CodingKey {
        case name
        case capital
        case states
    }
}


struct CountriesData: Codable, CodableInit {
    
    var code: Int?
    var list: [Country]?

    public init(list: [Country]?) {
        self.list = list
    }

    public enum CodingKeys: String, CodingKey {
        
        case code
        case list = "result"
    }
}
