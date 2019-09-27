//
//  ViewController.swift
//  ThreeDayStudy
//
//  Created by le tong on 2019/9/27.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
   
    var tableView = UITableView()
    let identifier = "identifier"
    let identifierOwn = "identifierOwn"
    let identifierLog = "identifierLog"
    
    var baseModel = BaseModel(iconImage: "", name: "", content: "", array: [])
    var modelArray:[models] = []
    
    var socialModelArray:[models] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCurrentModel()
        self.setTableViewUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setCurrentModel() -> Void {
        modelArray = [models(icon: "calculator", name: "jisuanqi"),
                      models(icon: "check", name: "check"),
                      models(icon: "image", name: "image"),
                      models(icon: "info", name: "info"),
                      models(icon: "setting", name: "setting")
        ]
        baseModel = BaseModel(iconImage: "user", name: "乐乐", content: "update your profile", array:modelArray)
        
        socialModelArray = [models (icon: "github", name: "github"),
                            models (icon: "twitter", name: "twitter"),
                            models (icon: "wechat", name: "wechat")]
    }
    
    func setTableViewUI() -> Void {
        tableView = UITableView.init(frame: view.bounds, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.init(displayP3Red: 239 / 255.0, green: 239 / 255.0, blue: 244 / 255.0, alpha: 1)
        tableView.register(BaseTableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        tableView.register(BaseOwnTableViewCell.classForCoder(), forCellReuseIdentifier: identifierOwn)
        tableView.register(BaseLogTableViewCell.classForCoder(), forCellReuseIdentifier: identifierLog)
        self.view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }else{
            return 60
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            return modelArray.count + 1
        }else if section == 3 {
            return socialModelArray.count
        }else{
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:BaseOwnTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifierOwn) as! BaseOwnTableViewCell
            cell.updateCurrentUI(model: baseModel)
            return cell
        }else if indexPath.section == 1 || indexPath.section == 2 {
            let cell:BaseTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier) as! BaseTableViewCell
            if indexPath.section == 1 {
                if indexPath.row == modelArray.count{
                   cell.updateCurrentUIWithNoIcon(name: "See More")
                }else{
                    cell.updateCurrentUI(model: modelArray[indexPath.row])
                }
            }else{
                cell.updateCurrentUIWithNoIcon(name: "Add Favorites")
            }
            return cell
        }else if indexPath.section == 3 {
            let cell:BaseTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier) as! BaseTableViewCell
            cell.updateCurrentUI(model: socialModelArray[indexPath.row])
            return cell
        }else if indexPath.section == 4 {
            let cell:BaseLogTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifierLog) as! BaseLogTableViewCell
            return cell
        }
        return UITableViewCell.init()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CurrentSection\(indexPath.section),CurrentRow\(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
            let titleLabel = UILabel.init(frame: CGRect(x: 20, y: 0, width: 100, height: 40))
            titleLabel.text = "Favorites"
            let view = UIView.init()
            view.addSubview(titleLabel)
            return view
        }else{
            return UIView.init()
        }
    }
    
    

}

