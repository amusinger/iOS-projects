//
//  ShowScoreController.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 9/19/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import UIKit

class ShowScoreController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let textLabel = UILabel(frame: CGRect(x: 16, y: 200, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
    var delegate:GoBackDelegate?
    
    @IBOutlet weak var tableView: UITableView!
   
    var score: Int!
    var total: Int!
    var answers: [String] = []

    var first = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return first.singleObject.quiz.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultTableViewCell")
            as! ResultTableViewCell
       
        cell.question.text = first.singleObject.quiz[indexPath.row].question as? String
        cell.givenAnswer.text = answers[indexPath.row] 
        cell.rightAnswer.text = first.singleObject.quiz[indexPath.row].rightAnswer as? String
        if (answers[indexPath.row] == first.singleObject.quiz[indexPath.row].rightAnswer as? String){
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
