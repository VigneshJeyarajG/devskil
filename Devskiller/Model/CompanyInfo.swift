//
//  CompanyInfo.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 19/07/22.
//  Copyright © 2022 Mindera. All rights reserved.
//

import UIKit

struct CompanyInfo {
    static var name = ""
    static var founder = ""
    static var founded = 0
    static var employees = 0
    static var launch_sites = 0
    static var valuation = 0
    
    static func addInfo(_ info: [String: Any]) {
        
        if let name = info["name"] as? String {
            CompanyInfo.name = name
        }
        
        if let founder = info["founder"] as? String {
            CompanyInfo.founder = founder
        }
        
        if let founded = info["founded"] as? Int {
            CompanyInfo.founded = founded
        }
        
        if let employees = info["employees"] as? Int {
            CompanyInfo.employees = employees
        }
        
        if let launch_sites = info["launch_sites"] as? Int {
            CompanyInfo.launch_sites = launch_sites
        }
        
        if let valuation = info["valuation"] as? Int {
            CompanyInfo.valuation = valuation
        }
    }
}



