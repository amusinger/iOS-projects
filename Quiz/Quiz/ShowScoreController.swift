//
//  ShowScoreController.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 9/19/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import UIKit

class ShowScoreController: UIViewController {

    
    let textLabel = UILabel(frame: CGRect(x: 16, y: 200, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
  
    
    var score: Int!
    var total: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.textColor = UIColor.white
        textLabel.text = "Your score is " + String(score) + " out of " + String(total)
        view.addSubview(textLabel)
    }
    
  

}
