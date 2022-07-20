//
//  UITableViewCell.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 20/07/22.
//  Copyright © 2022 Mindera. All rights reserved.
//

import UIKit

extension UITableViewCell: ReusableView { }

extension UITableViewCell {
    func timeStampToDate(timeStamp:Int, dateFormat:String) -> String {
        let epochTime = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: epochTime)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: TimeZone.current.identifier)
        dateFormatter.dateFormat = dateFormat
        let strDate = dateFormatter.string(from: date)
        return strDate
    }

    func timeStampToDate(timeStamp:Int) -> Date {
        let epochTime = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: epochTime)
        return date
    }
}
