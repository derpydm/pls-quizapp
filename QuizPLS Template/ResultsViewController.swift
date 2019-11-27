//
//  ResultsViewController.swift
//  QuizPLS Template
//
//  Created by Tinkertanker on 27/11/19.
//  Copyright © 2019 Tinkertanker. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int!
    var totalQuestions: Int!
    var type: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "You scored \(score ?? 0)/\(totalQuestions ?? 0) on the \(type ?? "Unknown") quiz!"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
