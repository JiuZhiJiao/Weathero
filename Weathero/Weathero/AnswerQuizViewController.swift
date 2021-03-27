//
//  AnswerQuizViewController.swift
//  Weathero
//
//  Created by JiuZhiJiao on 27/3/21.
//

import UIKit

class AnswerQuizViewController: UIViewController {
    
    // storyboard elements
    @IBOutlet weak var processBarView: UIView!
    @IBOutlet weak var restQuestionLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    var scenarioTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Quiz of \(scenarioTitle)")
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        
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
