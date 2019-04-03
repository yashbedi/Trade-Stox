//
//  TableViewHandling.swift
//  TadeStox
//
//  Created by Yash Bedi on 03/04/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

extension ViewController
{
    func setUpTableView()
    {
        upstoxTableView.tableFooterView = UIView()
        upstoxTableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return section == 0 ? 1 : 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        switch indexPath.section
        {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kSixLabelCell) as! SixLabelCell
            cell.YTDButton.addTarget(self, action: #selector(sendUnSubButtonClicked(_:)), for: .touchUpInside)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kEightLabelCell) as! EightLabelCell
            cell.LVLabel.text = Constants.LVTitleArray[indexPath.row]
            cell.RVLabel.text = Constants.RVTitleArray[indexPath.row]
            cell.LVLabelValue.text = leftArray.count > 0 ? "\(leftArray[indexPath.row])" : ""
            cell.RVLabelValue.text = rightArray.count > 0 ? "\(rightArray[indexPath.row])" : ""
            return cell
        default:
            return UITableViewCell()
        }
    }
}
