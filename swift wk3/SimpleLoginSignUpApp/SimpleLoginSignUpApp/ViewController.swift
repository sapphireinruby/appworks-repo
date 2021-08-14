//
//  ViewController.swift
//  SimpleLoginSignUpApp
//
//  Created by Amber on 8/12/21.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var checkTextField: UITextField!
    
    @IBOutlet weak var checkTextLabel: UILabel!
    
    @IBAction func inputTypeSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            checkTextField.isUserInteractionEnabled = false
            checkTextField.backgroundColor = .gray
            checkTextLabel.textColor = .gray
        case 1:
            checkTextField.isUserInteractionEnabled = true
            checkTextField.backgroundColor = .white
            checkTextLabel.textColor = .black
        default:
            checkTextField.isUserInteractionEnabled = false
            checkTextField.backgroundColor = .gray
            checkTextLabel.textColor = .gray
        }
    }
    
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UISegmentedControl.appearance().selectedSegmentTintColor = .black //the thunb bar
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected) //selected text color
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .normal) //normal or unselected text color
        
        UISegmentedControl.appearance().backgroundColor = .white //the whole "bar" background
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap) // tapping elasewhere on the view controller to dismiss the keyboard

    }
    
    
}

extension UIView {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//
//        return true
//
//    }
//}
