//
//  API.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 19/07/22.
//  Copyright © 2022 Mindera. All rights reserved.
//
import UIKit


struct API {
    static let liveUrl = "https://api.spacexdata.com/v3/"

    struct SateliiteManager {
        static let info = "\(API.liveUrl)info"
        static let satelite = "\(API.liveUrl)launches"
    }
}
