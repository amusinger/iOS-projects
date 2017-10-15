//
//  Quiz.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 10/2/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import Foundation

public class Quiz: NSObject {
    static let sharedInstance = Quiz()
    
    var quiz: [Question] = []

    override init(){
        let one = Question(question: "2+2", variants: ["1", "2", "4", "5", "6", "9"], correctAnswer : "4")
        let two = Question(question: "tifsw", variants: ["west", "stew", "fest", "swift"], correctAnswer : "swift")
        let three = Question(question: "1001 plus 0110 (in binary)", variants: ["14", "15", "16", "10", "99"], correctAnswer : "15")
        let four = Question(question: "7th letter of the alphabet", variants: ["G", "H", "I", "J"], correctAnswer : "H")
        let five = Question(question: "uizq", variants: ["quiz", "quid","zuiq"], correctAnswer : "quiz")
        let six = Question(question: "123 * 32", variants: ["3936", "4234", "5234", "3244"], correctAnswer : "3936")
        let seven = Question(question: "How many holes in a polo", variants: ["1", "2", "3", "four"], correctAnswer : "3")
        
        let fullQuiz = [one, two, three, four, five, six, seven]
        for i in 0..<5{
            let j = Int(arc4random_uniform(7))
            //quiz[i] = fullQuiz[j]
            quiz.append(fullQuiz[j])
        }
    }
}
