//
//  FeedbackViewController.swift
//  Weathero
//
//  Created by JiuZhiJiao on 28/3/21.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    var wrongAnswers = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        print("wrong answer: \(wrongAnswers)")
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
