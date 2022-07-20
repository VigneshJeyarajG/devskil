//
//  AlamofireManager.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 19/07/22.
//  Copyright © 2022 Mindera. All rights reserved.
//

import UIKit
import Alamofire

class APIClient {
    
    static let shared = APIClient()

    func satelite(completion: @escaping (Bool, Error?) -> Void) {
        let url = API.SateliiteManager.satelite
        SateLiteArray.detail.removeAll()
        AF.request(url ,method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON {response in
            switch response.result {
                case .success:
                if let infoArray = response.value as? [[String:Any]] {
                    for info in infoArray {
                        Satelite.addInfo(info)
                    }
                }
                completion(true, nil)
                case .failure(let error):
                    completion(false, error)
            }
        }
    }
    
    func companyInfo(completion: @escaping (Bool, Error?) -> Void) {
        let url = API.SateliiteManager.info
        AF.request(url ,method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON {response in
            switch response.result {
                case .success:
                if let info = response.value as? [String:Any] {
                    CompanyInfo.addInfo(info)
                }
                    completion(true, nil)
                case .failure(let error):
                    completion(false, error)
            }
        }
    }
}
        
        
