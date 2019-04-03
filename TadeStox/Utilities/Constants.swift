//
//  Constants.swift
//  TadeStox
//
//  Created by Yash Bedi on 03/04/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

public struct Constants {
    static let BaseURL : String = "http://kaboom.rksv.net"
    
    static let FetchHistory : String = "/api/historical"
    
    static let Error : String = "Error"
    
    static let ApiFailErrorMessage : String = "Couldn't Parse object\nTry Again After sometime\nor\nContact : yashbeerbedi@gmail.com"
    
    static let LVTitleArray : [String] = ["Day High","Open","Avg Volume","52wk High"]
    
    static let RVTitleArray : [String] = ["Day Low","Today's Close","Volume","52wk Low"]
    
    static let kSixLabelCell  : String = "SixLabelCell"
    
    static let kEightLabelCell : String = "EightLabelCell"
    
    static let AppSpecifiFont : String = "HelveticaNeue-Light"
    
    static let kOpen : String = "Open"
    
    static let kHigh : String = "High"
    
    static let kLow : String = "Low"
    
    static let kClose : String = "Close"
    
}
