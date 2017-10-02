//
//  Question.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 10/2/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import Foundation


public class Question{
    var question: String = ""
    var variants: [String] = []
    var rightAnswer: String = ""
    
    public init(question:String, variants:[String], rightAnswer : String)
    {
        self.question = question
        self.variants = variants
        self.rightAnswer = rightAnswer
    }
}
