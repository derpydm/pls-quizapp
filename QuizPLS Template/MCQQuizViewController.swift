//
//  MCQQuizViewController.swift
//  QuizPLS Template
//
//  Created by Tinkertanker on 27/11/19.
//  Copyright © 2019 Tinkertanker. All rights reserved.
//

import UIKit

class MCQQuizViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    var questions = [MCQQuestion(question: "Answer is 3", ans1: "122", ans2: "434", ans3: "3", ans4: "ieheh", correctAnswer: "3"), MCQQuestion(question: "Answer is 122", ans1: "122", ans2: "434", ans3: "3", ans4: "ieheh", correctAnswer: "122")]
    var currentQuestion = 0
    var question: MCQQuestion!
    var score = 0
    @IBOutlet var tapGestureRecogniser: UITapGestureRecognizer!
    @IBOutlet weak var questionLabel: UILabel!
    @IBAction func updateQuestion(_ sender: Any) {
        currentQuestion += 1
        if currentQuestion > questions.count - 1 {
            currentQuestion = 0
            performSegue(withIdentifier: "toResults", sender: self)
        } else {
            question = questions[currentQuestion]
            updateView(with: question)
        }
        
        
        tapGestureRecogniser.isEnabled = false
    }
    func updateView(with question: MCQQuestion) {
        aButton.isUserInteractionEnabled = true
        bButton.isUserInteractionEnabled = true
        cButton.isUserInteractionEnabled = true
        dButton.isUserInteractionEnabled = true
        questionLabel.text = question.question
        aButton.setTitle(question.ans1, for: .normal)
        bButton.setTitle(question.ans2, for: .normal)
        cButton.setTitle(question.ans3, for: .normal)
        dButton.setTitle(question.ans4, for: .normal)
    }
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.isHidden = true
        aButton.layer.cornerRadius = 10
        aButton.layer.borderWidth = 1
        bButton.layer.cornerRadius = 10
        bButton.layer.borderWidth = 1
        cButton.layer.borderWidth = 1
        cButton.layer.cornerRadius = 10
        dButton.layer.borderWidth = 1
        dButton.layer.cornerRadius = 10
        question = questions[0]
        updateView(with: question)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.currentTitle! == question.correctAnswer {
            questionLabel.text = "Correct! (Tap for next question)"
            score += 1
        } else {
            questionLabel.text = "Wrong! (Tap for next question)"
        }
        tapGestureRecogniser.isEnabled = true
        aButton.isUserInteractionEnabled = false
        bButton.isUserInteractionEnabled = false
        cButton.isUserInteractionEnabled = false
        dButton.isUserInteractionEnabled = false
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toResults" {
            let dest = segue.destination as! ResultsViewController
            dest.score = score
            dest.totalQuestions = questions.count
            dest.type = "MCQ"
        }
    }
    
    
}
