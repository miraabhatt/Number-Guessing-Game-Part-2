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
        // change this to be the "".count of an interpolated MAX_RANDOM_NUMBER into a string, this means take the number of characters in the maximum random number and turn that into the max length for the text field
        return "\(MAX_RANDOM_NUMBER)".count 
    }
   
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetGame()
    }
    
    func resetGame() {
        randomNumber = Int.random(in: MIN_RANDOM_NUMBER...MAX_RANDOM_NUMBER )
        resetMessageLabel()
        messagesTextView.text = "Starting new game"
    }
    
    func resetMessageLabel() {
        messageLabel.text = "Make a guess between \(self.MIN_RANDOM_NUMBER) and \(self.MAX_RANDOM_NUMBER)"
        messageLabel.textColor = UIColor.black
    }

    @IBAction func makeAGuess(_ sender: Any) {
        // get guess from text field and convert to an Int
        let guess = Int(guessTextField.text ?? "") ?? 0
        var message = ""
        // check guess against random number and enter and generate appropriate message with appropriate text color
        if guess < self.MIN_RANDOM_NUMBER && guess > self.MAX_RANDOM_NUMBER {
            // invalid guess
            message = "invalid guess"
            messageLabel.textColor = UIColor.red
        } else if guess < self.randomNumber {
            // too low
            message = "too low"
            messageLabel.textColor = UIColor.red
        } else if guess > self.randomNumber {
            // too high
            message = "too high"
            messageLabel.textColor = UIColor.red
        } else {
            // correct
        }
        messageLabel.text = message
        messagesTextView.text += "\n\(guess) - \(message)"
        // if guess is correct, disable UI
        // no matter what, update the UI for the new guess message
        // if the guess is correct, create a timer that will reset the entire game and store in timer member
        // be sure to test for and invalidate any existing timer
        // if the guess is not correct, create a timer that will reset the message label after three seconds
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        self.view.endEditing(true) // resign any embedded text field first responder status
    }
}

extension ViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // test whether textField.text is equal to nil, if so disable guessButton, else enable it 
        if textField.text == nil {
            guessButton.isEnabled = false
        } else {
            guessButton.isEnabled = true 
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // use a guard statement to unwrap textField.text and on else return true, this means that if the textfield is empty, then it will return true for should the new characters be added.
        guard let text = textField.text else { return true }
        // declare a constant called newLength that gets the text.count + the string.count - the range.length, this means that new length is equal to the existing text plus the new text minus the selected text.
        let newLength = text.count + string.count - range.length 
        // if newLength == 0 { disable guessButton} else {guessButton enable}
        if newLength == 0 {guessButton.isEnabled = false}
        else {guessButton.isEnabled = true}
        // return newLength is less than or equal to MAX_LENGTH_OF_TEXT_FIELD, this will return true and say the new characters should be added only if the new number of characters is less than or equal to the max number of characters allowed
        return newLength <= MAX_LENGTH_OF_TEXT_FIELD 
    }
}

extension ViewController:UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer.location(in: guessButton.superview).x > guessButton.frame.minX && gestureRecognizer.location(in: guessButton.superview).x < guessButton.frame.maxX && gestureRecognizer.location(in: guessButton.superview).y > guessButton.frame.minY && gestureRecognizer.location(in: guessButton.superview).y < guessButton.frame.maxY {
            return false
        }
        return true
    }
}
