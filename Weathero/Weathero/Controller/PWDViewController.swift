//
//  PWDViewController.swift
//  Weathero
//
//  Created by 苏桐 on 30/3/21.
//

import UIKit

class PWDViewController: UIViewController {

    @IBOutlet weak var pwdField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickOkButton(_ sender: Any) {
        let pwd = pwdField.text
        if pwd == "131415" {
            //jump to App screen
            self.performSegue(withIdentifier: "showApp", sender: nil)
        } else {
            //show error information
            let alter = UIAlertController(title: "Password Error", message: "The password is wrong, please try again.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: .none)
            alter.addAction(ok)
            present(alter, animated: true, completion: nil)
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
