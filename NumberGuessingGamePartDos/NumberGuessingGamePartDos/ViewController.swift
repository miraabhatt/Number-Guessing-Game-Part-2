//
//  ViewController.swift
//  NumberGuessingGamePartDos
//
//  Created by User on 12/8/18.
//  Copyright © 2018 theCoderSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var messagesTextView: UITextView!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    // Constants
    // add constant MIN_RANDOM_NUMBER using let and have it get 1
    let MIN_RANDOM_NUMBER = 1
    // add constant MAX_RANDOM_NUMBER using let and have it get 9
    let MAX_RANDOM_NUMBER = 9
    // declare a variable called MAX_LENGTH_OF_TEXT_FIELD and place a block next to it that returns 1 this will be used in limiting the number of characters, when you place a {} block after a variable declaration, it creates a computed property, or a property who's value is calculated at run time, you can explicitly set getters and setters within the block using get {} and set(newValue) {} if you omit both get and set and return a value, it by default creates this return as a getter.  computed properties must explicitly be given a type, like var MAX_TEXT_FIELD_CHARS:Int { }
    var MAX_LENGTH_OF_TEXT_FIELD:Int {
        return 1
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func makeAGuess(_ sender: Any) {
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
    }
}

extension ViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guessButton.isEnabled = true 
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // use a guard statement to unwrap textField.text and on else return true, this means that if the textfield is empty, then it will return true for should the new characters be added.
        guard let text = textField.text else { return true }
        // declare a constant called newLength that gets the text.count + the string.count - the range.length, this means that new length is equal to the existing text plus the new text minus the selected text.
        let newLength = text.count + string.count - range.length 
        // if newLength == 0 { disable guessButton} else {guessButton enable}
        if newLength == 0 {guessButton.isEnabled = false}
        else {guessButtion.isEnabled = true} 
            
        
        // return newLength is less than or equal to MAX_LENGTH_OF_TEXT_FIELD, this will return true and say the new characters should be added only if the new number of characters is less than or equal to the max number of characters allowed
        return newLength <= MAX_LENGTH_OF_TEXT_FIELD 
    }
}

extension ViewController:UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
