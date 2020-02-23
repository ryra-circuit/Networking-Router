//
//  State.swift
//  Networking-Router
//
//  Created by Dushan Saputhanthri on 23/2/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

struct State: Codable, CodableInit {
    
    var code: String?
    var name: String?

    public init(code: String?, name: String?) {
        self.code = code
        self.name = name
    }

    public enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}
