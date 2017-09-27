//
//  ResultTableViewCell.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 9/26/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import Foundation
import UIKit

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var rightAnswer: UILabel!
    @IBOutlet weak var givenAnswer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
