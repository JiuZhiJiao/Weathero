//
//  LearningViewController.swift
//  Weathero
//
//  Created by JiuZhiJiao on 27/3/21.
//

import UIKit

class LearningViewController: UIViewController {
    
    var scenarioTitle = ""

    @IBOutlet weak var scenarioImage: UIImageView!
    @IBOutlet weak var scenarioIntroLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in scenarios {
            if item.name == scenarioTitle{
                scenarioImage.image = item.learningImage
                scenarioIntroLabel.text = item.desc
            }
        }
        print(scenarioTitle)
    }
    
    // send scenario title through segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AnswerQuizViewController {
            let vc = segue.destination as? AnswerQuizViewController
            vc?.scenarioTitle = scenarioTitle
            
        }
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
