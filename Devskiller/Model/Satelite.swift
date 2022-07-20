//
//  Satelite.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 20/07/22.
//  Copyright © 2022 Mindera. All rights reserved.
//

import UIKit

struct Satelite {
    
    dynamic var mission_name = ""
    dynamic var launch_year = ""
    dynamic var launch_date_unix = 0
    dynamic var rocket = [String:Any]()
    dynamic var links = [String:Any]()
    
    static func addInfo(_ info: [String: Any]) {
        
        var sateliteInfo = Satelite()
        
        if let mission_name = info["mission_name"] as? String {
            sateliteInfo.mission_name = mission_name
        }
        
        if let launch_year = info["founder"] as? String {
            sateliteInfo.launch_year = launch_year
        }
        
        if let launch_date_unix = info["launch_date_unix"] as? Int {
            sateliteInfo.launch_date_unix = launch_date_unix
        }
        
        if let rocket = info["rocket"] as? [String:Any] {
            sateliteInfo.rocket = rocket
        }
        
        if let links = info["links"] as? [String:Any] {
            sateliteInfo.links = links
        }
        SateLiteArray.detail.append(sateliteInfo)
    }
}

struct SateLiteArray {
    static var detail = [Satelite]()
    static var wikipediaLink = ""
}



