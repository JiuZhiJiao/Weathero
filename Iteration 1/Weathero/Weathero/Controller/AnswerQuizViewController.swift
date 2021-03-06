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
    var questionNumber = 0
    var correctAnswer = 0
    lazy var allQuestion = QuestionBank().list
    var allQuestions = [Question]()
    // wrong answer collect the index of the questions, begin with 0
    var wrongAnswers = [Question]()
    var selectedOptions = [Int]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        for item in allQuestion{
            if item.setName == scenarioTitle{
                allQuestions = item.list
            }
        }
        reloadQuestion()
        reloadUI()

        print("Quiz of \(scenarioTitle)")
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            print("correct")
        } else {
            selectedOptions.append(sender.tag)
            wrongAnswers.append(allQuestions[questionNumber])
            print("\(questionNumber) is incorrect")
        }
        questionNumber += 1
        reloadQuestion()
    }
    
    // MARK: - Other Functions
    func reloadQuestion() {
        if questionNumber < allQuestions.count {
            let currentQuestion = allQuestions[questionNumber]
            questionLabel.text = currentQuestion.questionText
            optionA.setTitle("     A. "+currentQuestion.optionA, for: .normal)
            optionB.setTitle("     B. "+currentQuestion.optionB, for: .normal)
            optionC.setTitle("     C. "+currentQuestion.optionC, for: .normal)
            optionD.setTitle("     D. "+currentQuestion.optionD, for: .normal)
            correctAnswer = currentQuestion.correctAnswer
            reloadUI()
        } else {
            // fill the progress bar and change title
            processBarView.frame.size.width = view.frame.size.width
            restQuestionLabel.text = "All Done"
            
            let alter = UIAlertController(title: "Well Done", message: "End of Quiz. Do you want to get feedback?", preferredStyle: .alert)
            let feedbackAction = UIAlertAction(title: "Get Feedback", style: .default, handler: {action in self.getFeedback()})
            let quitAction = UIAlertAction(title: "Quit", style: .default, handler: {action in self.quit()})
            //let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in print("cancel feedback")})
            alter.addAction(feedbackAction)
            alter.addAction(quitAction)
            //alter.addAction(cancelAction)
            present(alter, animated: true, completion: nil)
        }
    }
    
    func reloadUI() {
        restQuestionLabel.text = "\(allQuestions.count - questionNumber) Questions Left"
        processBarView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.count)) * CGFloat(questionNumber)
    }
    
    func getFeedback() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let feedbackVC = storyBoard.instantiateViewController(withIdentifier: "feedbackViewController") as? FeedbackViewController else {
            return
        }
        feedbackVC.selectedOptions = selectedOptions
        feedbackVC.wrongAnswers = wrongAnswers
        navigationController?.show(feedbackVC, sender: nil)
    }
        
    func quit() {
        navigationController?.popViewController(animated: true)
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
