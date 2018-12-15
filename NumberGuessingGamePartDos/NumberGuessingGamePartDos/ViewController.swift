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
        
        
        return true
    }
}

extension ViewController:UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
