//
//  ViewController.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 9/12/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GoBackDelegate {

//    var quiz = [["question":"2+2", "variants":["1", "2", "4", "5", "6", "9"], "correctAnswer":"4"],
//                ["question": "tifsw", "variants":["west", "stew", "fest", "swift"], "correctAnswer":"swift"],
//                ["question": "1001 plus 0110 (in binary)", "variants":["14", "15", "16", "10", "99"], "correctAnswer":"15"]]
    
    let singleObject = Quiz.sharedInstance
    var variants : [String] = []
    var answered: [String] = []
    var currentQuestion = 0
    var currentQuestionText : String = ""
    var score : Int  = 0
    let questionLabel = UILabel(frame: CGRect(x: 16, y: 70, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadQuestion(currentQuestion)
    }
    
    func loadQuestion(_ currentQuestion:Int){
        //currentQuestionText = quiz[currentQuestion]["question"] as! String
        currentQuestionText = singleObject.quiz[currentQuestion].question
        questionLabel.text = currentQuestionText
        view.addSubview(questionLabel)

       // variants = quiz[currentQuestion]["variants"] as! [String]
        variants = singleObject.quiz[currentQuestion].variants
        for i in 0..<variants.count{
            makeButton(i)
        }
    }
    func startAgain(){
        navigationController?.popViewController(animated: true)
        score = 0
        answered = []
        currentQuestion = 0
        loadQuestion(currentQuestion)
    }
    func makeButton(_ i:Int){
        let button = UIButton(frame: CGRect(x: 16, y: 60*(i+2), width: Int(UIScreen.main.bounds.size.width-32), height: 45))
        button.backgroundColor = UIColor.blue
        button.setTitle(variants[i], for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)

    }
    
    func removeButtons(){
        for view in self.view.subviews{
            if(view is UIButton){
                view.removeFromSuperview()
            }
        }
    }
    
    
    func buttonClicked(_ sender:UIButton) {
        //let right = quiz[currentQuestion]["correctAnswer"] as! String
        let right =  singleObject.quiz[currentQuestion].rightAnswer
        answered.append(sender.currentTitle!)
        if(sender.currentTitle == right) {
            score += 1
        }
        
        if(currentQuestion < singleObject.quiz.count-1){
            currentQuestion += 1
            removeButtons()
            loadQuestion(currentQuestion)
        }
        
        else{
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "ShowScoreController") as! ShowScoreController
            VC.score = self.score
            VC.delegate = self
            VC.answers = self.answered

            VC.total = self.singleObject.quiz.count
            navigationController?.pushViewController(VC, animated: true)
        }
        
    }

}

