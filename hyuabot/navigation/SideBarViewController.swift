//
//  SideBarViewController.swift
//  hyuabot
//
//  Created by 이정인 on 2023/05/16.
//

import UIKit

class SideBarViewController: UITableViewController {
    let titles = ["셔틀버스", "통학버스", "노선버스", "전철", "학식", "열람실", "학사력", "캠퍼스 지도", "설정"]
    let icons = [
        UIImage(systemName: "bus.fill"),
        UIImage(systemName: "bus.fill"),
        UIImage(systemName: "bus.doubledecker.fill"),
        UIImage(systemName: "tram.fill"),
        UIImage(systemName: "fork.knife"),
        UIImage(systemName: "books.vertical"),
        UIImage(systemName: "calendar"),
        UIImage(systemName: "map"),
        UIImage(systemName: "gearshape"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = UILabel()
        header.frame = CGRect(x: 20, y: 30, width: self.view.frame.width, height: 30)
        header.text = "전체 메뉴"
        header.textColor = UIColor.white
        header.font = UIFont.boldSystemFont(ofSize: 18)
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        view.backgroundColor = UIColor(hexCode: "0E4A84")
        view.addSubview(header)
        
        self.tableView.tableHeaderView = view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return self.titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "menuCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) ?? UITableViewCell(style: .default, reuseIdentifier: cellID)

        cell.textLabel?.text = self.titles[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.imageView?.image = self.icons[indexPath.row]
        return cell
    }
}
