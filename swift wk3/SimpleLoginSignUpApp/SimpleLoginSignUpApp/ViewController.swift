import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var checkTextField: UITextField!
    
    @IBOutlet weak var checkTextLabel: UILabel!
    
    @IBOutlet weak var inputType: UISegmentedControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UISegmentedControl.appearance().selectedSegmentTintColor = .black //the thunb bar
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected) //selected text color
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .normal) //normal or unselected text color
        
        UISegmentedControl.appearance().backgroundColor = .white //the whole "bar" background
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap) // tapping elasewhere on the view controller to dismiss the keyboard
        
        checkTextField.isUserInteractionEnabled = false
        checkTextField.backgroundColor = .gray
        checkTextLabel.textColor = .gray
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
    

    
    func validateField() -> String? {
        
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
    } //check if the log in info. is correct
    
    
    func newSignUp() -> Bool {
        if inputType.selectedSegmentIndex == 1 && passwordTextField.text == checkTextField.text{
            return true
        }
        return false
    } //check sign in passwords
    
    
    @IBAction func processButton(_ sender: UIButton) {
        let rightUser = onlyUserLogIn()
        let emptyField = validateField()
        let matchingPasswords = checkPassword()
        
        //successful log in condiction
        if rightUser == true {
            let alert = UIAlertController(title: "Welcome", message: "Log in successful.", preferredStyle: .alert) // worng log in information

            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } //successful log in condiction
        
        if matchingPasswords == true && emptyField == nil {
            let alert = UIAlertController(title: "Thank you", message: "Sign Up successful.", preferredStyle: .alert)

            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        }//successful Sign Up condiction
        
        
        if  rightUser == false && emptyField == nil {
            let alert = UIAlertController(title: "Error", message: "Login fail.", preferredStyle: .alert) // worng log in information

            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } // check if log in info is correct
        
        if emptyField != nil && rightUser != true {
            let alert = UIAlertController(title: "Error", message: "\(emptyField!) should not be empty.", preferredStyle: .alert) // ! to force unwrap which field is empty
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } // Show error msg for each empty fields
        
    }
    
    
}

extension UIView {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
