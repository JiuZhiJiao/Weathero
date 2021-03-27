//
//  QuizViewController.swift
//  Weathero
//
//  Created by JiuZhiJiao on 25/3/21.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ScenarioTableView: UITableView!
    
    struct Scenario {
        var image: UIImage?
        var name: String
    }
    // Default date
    var scenarios = [
        Scenario(image: #imageLiteral(resourceName: "ClimateChange"), name: "Climate Change"),
        Scenario(image: #imageLiteral(resourceName: "Droughts"), name: "Droughts"),
        Scenario(image: #imageLiteral(resourceName: "Floods"), name: "Floods")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Change the frame of navigation bar
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Table View
        ScenarioTableView.delegate = self
        ScenarioTableView.dataSource = self
        ScenarioTableView.backgroundColor = .white
        ScenarioTableView.reloadData()
    }
    
    // MARK: - Table View Function
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scenarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scenarioCell", for: indexPath) as! ScenarioTableViewCell
        
        cell.scenarioImage?.image = scenarios[indexPath.row].image
        cell.scenarioImage?.layer.cornerRadius = 10.0
        //cell.scenarioImage?.clipsToBounds = true
        cell.scenarioImage?.contentMode = .scaleAspectFill
        
        cell.scenarioName?.text = scenarios[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
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
