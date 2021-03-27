//
//  HomeViewController.swift
//  Weathero
//
//  Created by JiuZhiJiao on 25/3/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var GainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Change the frame of navigation bar
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Change the button
        GainButton.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }
    
    // Translate to Quiz page
    @IBAction func ClickToQuiz(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
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
