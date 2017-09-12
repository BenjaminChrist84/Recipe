//
//  MealTableViewCell.swift
//  RecipesForYou
//
//  Created by Benjamin Christ on 11.09.17.
//  Copyright © 2017 Benjamin Christ. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mealCellImageView: UIImageView!
    @IBOutlet weak var mealCellLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
