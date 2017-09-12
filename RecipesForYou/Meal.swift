//
//  Meal.swift
//  RecipesForYou
//
//  Created by Benjamin Christ on 11.09.17.
//  Copyright © 2017 Benjamin Christ. All rights reserved.
//

import UIKit

class Meal{
    
    // Properties
    
    var name: String
    var recipe: String?
    var image: UIImage?
    
    init?(name: String, recipe: String?, image: UIImage?){

        // Initialization fails if name is empty
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        self.recipe = recipe
        self.image = image
        
    }
    
}
