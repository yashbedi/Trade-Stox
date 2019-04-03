//
//  SixLabelCell.swift
//  TadeStox
//
//  Created by Yash Bedi on 03/04/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

class SixLabelCell: UITableViewCell {

    @IBOutlet weak var OneMonthButton: UIButton!
    @IBOutlet weak var OneDayButton: UIButton!
    @IBOutlet weak var OneYearButton: UIButton!
    @IBOutlet weak var AllButton: UIButton!
    @IBOutlet weak var YTDButton: YBButton!
    @IBOutlet weak var ThreeMonthButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
