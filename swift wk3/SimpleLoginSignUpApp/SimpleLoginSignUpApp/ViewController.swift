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
            checkTextField.isUserInteractionEnabled = false;
            checkTextField.backgroundColor = .gray
            checkTextLabel.textColor = .gray
        default:
            checkTextField.isUserInteractionEnabled = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

