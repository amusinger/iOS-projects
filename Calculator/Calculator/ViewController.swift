//
//  ViewController.swift
//  Calculator
//
//  Created by Aizhan Yerimbetova on 9/5/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var calc = Calculator()
    var stillTyping = false
    var dotEntered = false
    var resultNumber = 0.0
    var signClicked = "-"
    var percentClicked = false;
    
    @IBAction func numberClicked(_ sender: UIButton) {
        if(calc.firstNumber == 0.0 && resultText.text == "0")
        {
            resultText.text = ""
        }
//        resultText.text = resultText.text! + sender.titleLabel!.text!
        let numberEntered = sender.currentTitle!
        if numberEntered == "." {
            if dotEntered {
                return
            }
            else {
                dotEntered = true
            }
        }
        if(numberEntered == "+/-"  && signClicked == "-"){
            resultText.text = "-" + resultText.text!
            signClicked = "+"
            return
        }
        if(numberEntered == "+/-"  && signClicked == "+"){
            signClicked = "-"
            resultText.text = String(Double(resultText.text!)! * (-1))
            return
        }
        if stillTyping {
            resultText.text = resultText.text! + numberEntered
        }
        else {
            resultText.text = numberEntered
            stillTyping = true
        }

    }
    @IBAction func operationClicked(_ sender: UIButton) {
        dotEntered = false
        stillTyping = false
        
        calc.operation = sender.titleLabel!.text!
        calc.firstNumber = Double(resultText.text!)!


       
    }
    
    @IBAction func resultClicked(_ sender: UIButton) {
        calc.secondNumber = Double(resultText.text!)!
        
        resultNumber = calc.Calculate()
        if (resultNumber.truncatingRemainder(dividingBy: 1) == 0){
            resultText.text = String(format: "%.0f",resultNumber)
        }
        else{
            resultText.text = String(resultNumber)
        }
        dotEntered = false
        stillTyping = false
        calc = Calculator()
        calc.firstNumber = Double(resultText.text!)!
        calc.secondNumber = 0
    
    }
    @IBAction func clearText(_ sender: UIButton) {
        calc.firstNumber = 0.0
        calc.secondNumber = 0.0
        calc.operation = ""
        resultText.text = "0"
        signClicked = "-"
        stillTyping = false
        dotEntered = false
        calc = Calculator()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

