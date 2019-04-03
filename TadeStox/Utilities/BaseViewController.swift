//
//  BaseViewController.swift
//  TadeStox
//
//  Created by Yash Bedi on 03/04/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseViewController {
    open func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    open func getAvg(_ array:[Double])->Double{
        let average = array.reduce(0.0) {
            return $0 + $1/Double(array.count)
        }
        return average
    }
    
    open func getDateFromTimeStamp(timeStamp : Double) -> String {
        let date = NSDate(timeIntervalSince1970: timeStamp)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd:MM:YY"
        //dayTimePeriodFormatter.dateFormat = "ssZ:mm:hh"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
}

