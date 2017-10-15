//
//  ViewController.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 9/12/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GoBackDelegate{
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    //let singleObject = Quiz.sharedInstance
    var variants : [String] = []
    var answered: [String] = []
    var currentQuestion = 0
    var currentQuestionText : String = ""
    var score : Int  = 0
    let questionLabel = UILabel(frame: CGRect(x: 16, y: 70, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
    var fullQuiz: [Question] = []
    var quiz: [Question] = []
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityLoader()
        APIManager.getQuizWithAlamofire {
            (result) in
            for q in result{
                self.fullQuiz.append(Question(question: q["question"] as! String , variants: q["variants"] as! [String], correctAnswer: q["correctAnswer"] as! String))
            }
  
            for _ in 0..<5{
                let j = Int(arc4random_uniform(7))
                self.quiz.append(self.fullQuiz[j])
            }
           
            self.activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
         
            self.loadQuestion(self.currentQuestion)
        }
        
  
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func activityLoader(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func loadQuestion(_ currentQuestion:Int){
        //currentQuestionText = singleObject.quiz[currentQuestion].question
        currentQuestionText = quiz[currentQuestion].question
        questionLabel.text = currentQuestionText
        view.addSubview(questionLabel)

        //variants = singleObject.quiz[currentQuestion].variants
        variants = quiz[currentQuestion].variants
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
        let right = quiz[currentQuestion].correctAnswer 
       // let right =  singleObject.quiz[currentQuestion].correctAnswer
        answered.append(sender.currentTitle!)
        if(sender.currentTitle == right) {
            score += 1
        }
        
        if(currentQuestion < quiz.count-1){
            currentQuestion += 1
            removeButtons()
            loadQuestion(currentQuestion)
        }
        
        else{
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "ShowScoreController") as! ShowScoreController
            VC.score = self.score
            VC.delegate = self
            VC.answers = self.answered
            VC.quiz = self.quiz
            VC.total = self.quiz.count
            navigationController?.pushViewController(VC, animated: true)
        }
        
    }

}

