//
//  Calculator.swift
//  Calculator
//
//  Created by Aizhan Yerimbetova on 9/5/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import UIKit

class Calculator: NSObject {
    
    var result:Double = 0.0
    var firstNumber:Double = 0.0
    var secondNumber:Double = 0.0
    
    var operation:String = ""
    

    func Calculate() -> Double{
        switch(operation){
        case("-"): result = firstNumber - secondNumber
        case("+"): result = firstNumber + secondNumber
        case("*"): result = firstNumber * secondNumber
        case("/"):
            if(secondNumber != 0)
            {
                result = firstNumber / secondNumber
            }
            else{
                result = firstNumber
            }
        case("%"): result = firstNumber + (secondNumber*100/firstNumber)
        default: result = 0.0
            
        }
       return result
    }
    
    

}
