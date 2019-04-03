//
//  EightLabelCell.swift
//  TadeStox
//
//  Created by Yash Bedi on 03/04/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

class EightLabelCell: UITableViewCell {

    @IBOutlet weak var RVLabelValue: UILabel!
    @IBOutlet weak var RVLabel: UILabel!
    @IBOutlet weak var LVLabel: UILabel!
    @IBOutlet weak var LVLabelValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
