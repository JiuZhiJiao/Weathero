//
//  ScenarioTableViewCell.swift
//  Weathero
//
//  Created by JiuZhiJiao on 27/3/21.
//

import UIKit

class ScenarioTableViewCell: UITableViewCell {

    @IBOutlet weak var scenarioImage: UIImageView!
    @IBOutlet weak var scenarioName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
