//
//  ViewController.swift
//  Devskiller
//
//  Created by Ivo Silva on 18/09/2020.
//  Copyright © 2020 Mindera. All rights reserved.
//

import UIKit
import DropDown

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var statelightTableView: UITableView!
    @IBOutlet weak var companyInfoLabel: UILabel!
    @IBOutlet weak var dropdownButton: UIButton!
    
    let filterDropDown = DropDown()
    let filterArray = ["ASC and DESC"]
    var asendingBool = false
    var latestYearBool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        registerNib()
        companyInfoAPI()
        sateliteAPI()
        setupFilterDropDown()
    }
    
    func setupFilterDropDown() {
        filterDropDown.anchorView = dropdownButton
        filterDropDown.bottomOffset = CGPoint(x: 0, y: dropdownButton.bounds.height)
        filterDropDown.dataSource = filterArray
        filterDropDown.selectionAction = { [weak self] (index, item) in
            self!.changingOrder()
        }
    }
    
    func changingOrder() {
        if asendingBool {
            asendingBool = false
            SateLiteArray.detail = sorting(SateLiteArray.detail)
        } else {
            asendingBool = true
            SateLiteArray.detail = sorting(SateLiteArray.detail)
        }
        
        statelightTableView.reloadData()
    }
    
    func sorting(_ satelite:[Satelite]) -> [Satelite] {
        let sateliteArray = satelite.sorted(by: { (Obj1, Obj2) -> Bool in
            let Obj1_Name = Obj1.mission_name
            let Obj2_Name = Obj2.mission_name
            if asendingBool {
                return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
            } else {
                return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedDescending)
            }
         })
        return sateliteArray
    }
    
    func latestLaunch() {
        if asendingBool {
            asendingBool = false
        } else {
            asendingBool = true
        }
    }
    
    func registerNib() {
        statelightTableView.register(SateliteTableViewCell.self)
    }
    
    func sateliteAPI() {
        LoadingUtils.shared.showActivityIndicator(self.view)
        APIClient.shared.satelite() { (Success, error) in
            if Success {
                self.displayData()
            } else if let error = error {
                self.alert(title: "Message", message: error.localizedDescription, cancel: "ok")
            }
        }
    }
    
    func companyInfoAPI() {
        LoadingUtils.shared.showActivityIndicator(self.view)
        APIClient.shared.companyInfo() { (Success, error) in
            LoadingUtils.shared.hideActivityIndicator(self.view)
            if Success {
                self.displayData()
            } else if let error = error {
                self.alert(title: "Message", message: error.localizedDescription, cancel: "ok")
            }
        }
    }
    
    func displayData() {
        
        companyInfoLabel.text = "\(CompanyInfo.name) was founded by \(CompanyInfo.founder) in \(CompanyInfo.founded). it has now  \(CompanyInfo.employees) employess, \(CompanyInfo.launch_sites) launch sites, and is values USD \(CompanyInfo.valuation)"
        
        if SateLiteArray.detail.count != 0 {
            statelightTableView.reloadData()
            statelightTableView.isHidden = false
        } else {
            statelightTableView.isHidden = true
        }
    }
    
    @IBAction func dropDownButtonAction(_ sender: UIButton) {
        filterDropDown.show()
    }
}


extension LaunchViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SateLiteArray.detail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = statelightTableView.dequeueReusableCell(for: indexPath) as SateliteTableViewCell
        cell.setCell(index: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let links = SateLiteArray.detail[indexPath.row].links
        
        if let wikipedia = links["wikipedia"] as? String {
            SateLiteArray.wikipediaLink = wikipedia
            navigationPushRedirect(storyBoardName: "Main", storyBoardId: "Wikipedia")
        } else {
            alert(title: "Message", message: "Wikipedia link is not available", cancel: "Ok")
        }        
    }
}
