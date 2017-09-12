//
//  ViewController.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 9/12/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makeButton()
    }
    
    var array = [String : [String]]()
    

    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    func makeButton(){
        let button = UIButton(frame: CGRect(x: 16, y: 50, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
        button.backgroundColor = UIColor.blue
        button.setTitle("hey", for: UIControlState.normal)
        button.addTarget(self, action:#selector(buttonClicked(_:)), for: .touchUpInside)
        self.view.addSubview(button)

    }
    
    
    func buttonClicked(_ sender:UIButton) {
        print("hello")
    }

}

