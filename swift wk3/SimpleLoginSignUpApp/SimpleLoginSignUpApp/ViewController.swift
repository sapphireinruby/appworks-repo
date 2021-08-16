import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var checkTextField: UITextField!
    
    @IBOutlet weak var checkTextLabel: UILabel!
    
    @IBOutlet weak var accountTextLabel: UILabel!
    
    @IBOutlet weak var passwordTextLabel: UILabel!
    
    @IBOutlet weak var inputType: UISegmentedControl!
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UISegmentedControl.appearance().selectedSegmentTintColor = .black //the thunb bar
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected) //selected text color
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .normal) //normal or unselected text color
        
        UISegmentedControl.appearance().backgroundColor = .white //the whole "bar" background
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap) // tapping elasewhere on the view controller to dismiss the keyboard
        
        // set the "Check" field disabled when load, due to the log in status:
        checkTextField.isUserInteractionEnabled = false
        checkTextField.backgroundColor = .gray
        checkTextLabel.textColor = .gray
        
        
        
        //try to set up the three text lables and text fields to be the same width
        accountTextLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextLabel.translatesAutoresizingMaskIntoConstraints = false
        checkTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        accountTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        checkTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let viewsDictionary = ["lab1" : accountTextLabel, "field1": accountTextField]
//        ["lab2" : passwordTextLabel, "field2": passwordTextField]
//        ["lab3" : checkTextLabel, "field3": checkTextField]
//
//        view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[lab1]|", options: [], metrics: nil, views: viewsDictionary))
      
        
        
//        Visual Format Language
//        H:|-[find]-[findNext]-[findField(>=20)]-|
//        H: (Horizontal) //horizontal direction
//        | (pipe) //superview
//        - (dash) //standard spacing (generally 8 points)
//        [] (brackets) //name of the object (uilabel, unbutton, uiview, etc.)
//        () (parentheses) //size of the object

        
        NSLayoutConstraint.activate([
            accountTextLabel.rightAnchor.constraint(equalTo: passwordTextLabel.rightAnchor),
//            passwordTextLabel.widthAnchor.constraint(equalToConstant: 8),
            checkTextLabel.rightAnchor.constraint(equalTo: passwordTextLabel.rightAnchor),


        ])
        
        
    }
    
    @IBAction func inputTypeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            checkTextField.isUserInteractionEnabled = false
            checkTextField.backgroundColor = .gray
            checkTextLabel.textColor = .gray

        } else if sender.selectedSegmentIndex == 1 {
            checkTextField.isUserInteractionEnabled = true
            checkTextField.backgroundColor = .white
            checkTextLabel.textColor = .black
        }
    }
    

    
    func validateLogInField() -> String? {
        
        if accountTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Account"
        } else if passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Password"
        }
        return nil //nil is all good, means all text fields are filled in!
    } // check if the text field are filled in and return the empty text field
    
    
    func validateSignUpField() -> String? {
        
        if accountTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Account"
        } else if passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Password"
        } else if checkTextField.text?.trimmingCharacters(in:  .whitespacesAndNewlines) == "" {
            return "Check"
        }
        return nil //nil is all good, means all text fields are filled in!
    } // check if the text field are filled in and return the empty text field


    func onlyUserLogIn() -> Bool {
        
        if inputType.selectedSegmentIndex == 0 &&
            accountTextField.text == "appworks_school@gmail.com" && passwordTextField.text == "1234" && checkTextField.text == "" {
            return true
        }
        return false
    } //check if the log in info. is correct, set the only correct condition
    
    
    func matchingPassword() -> Bool {
        if inputType.selectedSegmentIndex == 1 &&
            passwordTextField.text != "" &&
            passwordTextField.text == checkTextField.text &&
            accountTextField.text != "" {
            return true   //all right
        }
        return false
    } //check if the sign in passwords matche and no fields left out.
    
    
    @IBAction func processButton(_ sender: UIButton) {
        let rightUser = onlyUserLogIn()
        let emptyLogInField = validateLogInField()
        let emptySignUpField = validateSignUpField()
        let rightSignUp = matchingPassword()
        
        //successful log in condiction
        if rightUser == true {
            let alert = UIAlertController(title: "Welcome", message: "Log in successful.", preferredStyle: .alert)

            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } //successful log in msg
        
        if rightSignUp == true {
            let alert = UIAlertController(title: "Thank you", message: "Sign Up successful.", preferredStyle: .alert)

            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        }//successful Sign Up condiction
        
        // Error confition and msg:
        
        //log in: worng account but all fields filled in:
        if  inputType.selectedSegmentIndex == 0 && rightUser == false && emptyLogInField == nil {
            let alert = UIAlertController(title: "Error", message: "Login fail.", preferredStyle: .alert) // worng log in information

            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        }
        
        // log in: worng account with empty field:
        if  inputType.selectedSegmentIndex == 0 && rightUser == false && emptyLogInField != nil {
            let alert = UIAlertController(title: "Error", message: "\(emptyLogInField!) should not be empty.", preferredStyle: .alert) // ! to force unwrap which field is empty

            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } //error msg with detail
        
        // sign up: with empty fields:
        if inputType.selectedSegmentIndex == 1 && emptySignUpField != nil {
            let alert = UIAlertController(title: "Error", message: "\(emptySignUpField!) should not be empty.", preferredStyle: .alert) // ! to force unwrap which field is empty
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } //error msg with detail
        
        
        // sign up: matching passwords with empty fields:
        if inputType.selectedSegmentIndex == 1 && emptySignUpField != nil && rightSignUp == true {
            let alert = UIAlertController(title: "Error", message: "\(emptySignUpField!) should not be empty.", preferredStyle: .alert) // ! to force unwrap which field is empty
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } //error msg with detail
        
        // sign up: passwords not matching but no empty fields:
        if inputType.selectedSegmentIndex == 1 && emptySignUpField == nil && rightSignUp != true {
            let alert = UIAlertController(title: "Error", message: "Sing Up faild.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } //error msg with detail
    }
    
    
}

extension UIView {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
