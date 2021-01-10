//
//  ViewController.swift
//  Quiz App
//
//  Created by sadiq qasmi on 03/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var progressViewBar: UIProgressView!
    
    let quizBrain = QuizBrain()
    var i = 0
    var progressCounter:Float = 0.0
    var correctQuestionCount = 0
    
    
    override func viewWillAppear(_ animated: Bool) {
        progressViewBar.progress = 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContent()
        
    }
    
    @IBAction func onClickAction(_ sender: UIButton) {
        
        let userAns = sender.currentTitle!
        let actualAns = quizBrain.quiz[i].correctAns
        let totalQuestion = quizBrain.quiz.count
        
        if userAns == actualAns {
            correctQuestionCount += 1
            scoreLabel.text = "Score : \(correctQuestionCount)"
            print(correctQuestionCount)
            
            progressCounter = Float(correctQuestionCount) / Float(totalQuestion)
            progressViewBar.progress = progressCounter
            print(progressCounter)
        }else{
            
        }
        updateQuestion()
    }
    @IBAction func resetButton(_ sender: UIButton) {
        
        
    }
    
    func getContent(){
        if i < quizBrain.quiz.count {
            questionLabel.text = quizBrain.quiz[i].question
            answer1Button.setTitle(quizBrain.quiz[i].ans[0], for: .normal)
            answer2Button.setTitle(quizBrain.quiz[i].ans[1], for: .normal)
            answer3Button.setTitle(quizBrain.quiz[i].ans[2], for: .normal)
        }else {
            answer1Button.isHidden = true
            answer2Button.isHidden = true
            answer3Button.isHidden = true
            questionLabel.text = "You have finished your quiz and secure \(correctQuestionCount) / \(quizBrain.quiz.count)  "
        }
        
    }
    func updateQuestion(){
        
        i += 1
        
        viewDidLoad()
    }
    
    
    
}

