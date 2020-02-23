//
//  CountriesVC.swift
//  Networking-Router
//
//  Created by Dushan Saputhanthri on 23/2/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

class CountriesVC: UIViewController {
    
    let vm = CountriesVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.loadAllCountriesData(completion: { status, message in
            switch status {
            case true:
                print("Data count: \(self.vm.countryList.count)")
                //print("Data: \(self.vm.countryList)")
            default:
                print(message)
            }
        })
    }
}

