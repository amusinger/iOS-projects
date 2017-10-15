//
//  ShowScoreController.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 9/19/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import UIKit
import Instructions

class ShowScoreController: UIViewController, UITableViewDelegate, UITableViewDataSource, CoachMarksControllerDataSource, CoachMarksControllerDelegate {

  
    let textLabel = UILabel(frame: CGRect(x: 16, y: 200, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
    var delegate:GoBackDelegate?
    
    @IBOutlet weak var tableView: UITableView!
   
    var score: Int!
    var total: Int!
    var answers: [String] = []
    var quiz: [Question] = []

    var first = ViewController()
    
    let coachMarksController = CoachMarksController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.coachMarksController.dataSource = self
    }
    
    func numberOfCoachMarks(for coachMarksController: CoachMarksController) -> Int {
        return 1
    }
    
    let pointOfInterest = UIView()
    
    func coachMarksController(_ coachMarksController: CoachMarksController,
                              coachMarkAt index: Int) -> CoachMark {
        return coachMarksController.helper.makeCoachMark(for: self.navigationController?.navigationBar) { (frame: CGRect) -> UIBezierPath in
            // This will make a cutoutPath matching the shape of
            // the component (no padding, no rounded corners).
            return UIBezierPath(rect: frame)
        }
    }
    
    func coachMarksController(_ coachMarksController: CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: CoachMark) -> (bodyView: CoachMarkBodyView, arrowView: CoachMarkArrowView?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(withArrow: true, arrowOrientation: coachMark.arrowOrientation)
        coachViews.bodyView.hintLabel.text = "You've got " + String(self.score) + " points"
        coachViews.bodyView.nextLabel.text = "Ok!"
        
        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.coachMarksController.start(on: self)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.coachMarksController.stop(immediately: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultTableViewCell")
            as! ResultTableViewCell
       
        cell.question.text = quiz[indexPath.row].question
        cell.givenAnswer.text = answers[indexPath.row] 
        cell.rightAnswer.text = quiz[indexPath.row].correctAnswer
        if (answers[indexPath.row] == quiz[indexPath.row].correctAnswer){
            cell.givenAnswer.backgroundColor = UIColor.green
        }
        else{
            cell.givenAnswer.backgroundColor = UIColor.red
        }
        return cell
    }
    @IBAction func goBack(_ sender: UIButton) {
          delegate?.startAgain()
    }


}
