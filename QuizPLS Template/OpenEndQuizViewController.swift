//
//  OpenEndQuizViewController.swift
//  QuizPLS Template
//
//  Created by Tinkertanker on 27/11/19.
//  Copyright © 2019 Tinkertanker. All rights reserved.
//

import UIKit

class OpenEndQuizViewController: UIViewController {
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet var tapGestureRecogniser: UITapGestureRecognizer!
    @IBOutlet weak var questionLabel: UILabel!
    var questions = [OEQuestion(question: "What is 1+1?", correctAnswer: "2"), OEQuestion(question: "What is (𝐺𝜇𝜈+Λ𝜇𝜈−8𝜋𝐺𝑐4𝑇𝜇𝜈)²²²²² equal to?", correctAnswer: "0"), OEQuestion(question: "What is 𝐺𝜇𝜈+Λ𝜇𝜈−8𝜋𝐺𝑐4𝑇𝜇𝜈 equal to?", correctAnswer: "0")]
    var question: OEQuestion!
    var currentQuestion = 0
    var score = 0
    func updateView(with question: OEQuestion) {
        
        questionLabel.text = question.question
        button.isUserInteractionEnabled = true
    }
    @IBOutlet weak var textField: UITextField!
    @IBAction func updateQuestion(_ sender: Any) {
        if currentQuestion > questions.count - 1 {
            currentQuestion = 0
            performSegue(withIdentifier: "toResultsFromOE", sender: self)
        } else {
            question = questions[currentQuestion]
            updateView(with: question)
        }
        
        
        tapGestureRecogniser.isEnabled = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecogniser.isEnabled = false
        question = questions[0]
        questionLabel.text = question.question
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let text = textField.text
        currentQuestion += 1
        if currentQuestion > questions.count - 1 {
            if text == question.correctAnswer {
                score += 1
                questionLabel.text = "Correct! (Tap for results)"
            } else {
                questionLabel.text = "Wrong!  (Tap for results)"
            }
        } else if text == question.correctAnswer {
            score += 1
            questionLabel.text = "Correct! (Tap for next question)"
            
        } else {
            questionLabel.text = "Wrong! (Tap for next question)"
        }
        button.isUserInteractionEnabled = false
        tapGestureRecogniser.isEnabled = true
    }
    
    @IBOutlet weak var button: UIButton!
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toResultsFromOE" {
            let dest = segue.destination as! ResultsViewController
            dest.score = score
            dest.totalQuestions = questions.count
            dest.type = "Open-ended"
        }
    }


}
