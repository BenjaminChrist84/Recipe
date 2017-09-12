//
//  MealViewController.swift
//  RecipesForYou
//
//  Created by Benjamin Christ on 09.09.17.
//  Copyright © 2017 Benjamin Christ. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mealTXTField: UITextField!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealTXTField.delegate = self
        
        // Set up views to editing existing Meal.
        if let meal = meal {
            navigationItem.title = meal.name
            mealTXTField.text   = meal.name
            mealImageView.image = meal.image
            // ratingControl.rating = meal.rating
        }
        
        updateSaveButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func setMealLBLButton(_ sender: Any) {
        
        
    }
    
    // UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        updateSaveButton()
        navigationItem.title = textField.text
    }
    
    //MARK: Navigation
    
    @IBAction func canel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = mealTXTField.text ?? ""
        let image = mealImageView.image
//        let recipe = recipeTextField.rating
//        let category = categoryTextField.category
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        meal = Meal(name: name, recipe: "", image: image)
        
        
    }
    
    
    // Image action
    @IBAction func selectedImageFromLibary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        mealTXTField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        // only images can be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // ImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            else{fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")}
        
        mealImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    private func updateSaveButton(){
        
        // Disable the Save button if the text field is empty.
        let text = mealTXTField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
}

