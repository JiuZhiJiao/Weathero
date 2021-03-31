//
//  FeedbackViewController.swift
//  Weathero
//
//  Created by JiuZhiJiao on 28/3/21.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    @IBOutlet weak var labelQuestionNumber: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelSelected: UILabel!
    @IBOutlet weak var labelCorrect: UILabel!
    @IBOutlet weak var lableFeedback: UILabel!
    @IBOutlet weak var buttonNextFeedback: UIButton!
    
    var index = 0
    
    var wrongAnswers = [Question]()
    var selectedOptions = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("wrong answer: \(wrongAnswers.count), and \(selectedOptions)")
        reloadUI(question: wrongAnswers[index], selectedNum: selectedOptions[index])
    }
    
    @IBAction func nextFeedback(_ sender: Any) {
        
        if index < (wrongAnswers.count - 1) {
            
            index += 1
            
            reloadUI(question: wrongAnswers[index], selectedNum: selectedOptions[index])
        } else {
            buttonNextFeedback.isUserInteractionEnabled = false
            buttonNextFeedback.alpha = 0.4
        }
        
        
    }
    
    // MARK: - Other Functions
    func reloadUI(question: Question, selectedNum: Int) {
        labelQuestionNumber.text = "Question \(question.questionNum)"
        labelQuestion.text = question.questionText
        
        switch selectedNum {
        case 1:
            labelSelected.text = "A. \(question.optionA)"
        case 2:
            labelSelected.text = "B. \(question.optionB)"
        case 3:
            labelSelected.text = "C. \(question.optionC)"
        case 4:
            labelSelected.text = "D. \(question.optionD)"
        default:
            labelSelected.text = "Not Answer"
        }
        
        switch question.correctAnswer {
        case 1:
            labelCorrect.text = "A. \(question.optionA)"
        case 2:
            labelCorrect.text = "B. \(question.optionB)"
        case 3:
            labelCorrect.text = "C. \(question.optionC)"
        case 4:
            labelCorrect.text = "D. \(question.optionD)"
        default:
            labelCorrect.text = "Not Answer"
        }
        
        lableFeedback.text = question.feedback
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
