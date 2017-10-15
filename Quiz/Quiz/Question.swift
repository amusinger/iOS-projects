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
    var correctAnswer: String = ""
    
    public init(question:String, variants:[String], correctAnswer : String)
    {
        self.question = question
        self.variants = variants
        self.correctAnswer = correctAnswer
    }
}
