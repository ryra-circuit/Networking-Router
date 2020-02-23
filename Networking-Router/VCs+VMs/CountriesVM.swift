//
//  CountriesVM.swift
//  Networking-Router
//
//  Created by Dushan Saputhanthri on 23/2/20.
//  Copyright © 2020 RYRA Circuit. All rights reserved.
//

import UIKit

class CountriesVM: NSObject {

    var countryList: [Country] = []
    
    //MARK: Load All Countries data
    func loadAllCountriesData(completion: @escaping ActionHandler) {
        
        APIRouter.allCountries.send(CountriesData.self) {[weak self] (response) in
            switch response {
            case .failure(let error):
                // Handle error
                completion(false, error?.localizedDescription ?? "Unknown error occured.")
            case .success(let data):
                if let _data = data as? CountriesData {
                    self?.countryList.append(contentsOf: _data.list ?? [])
                    completion(true, "Data loaded successfully.")
                } else {
                    completion(false, "Data not loaded.")
                }
            }
        }
    }
}
