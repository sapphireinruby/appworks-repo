import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var checkTextField: UITextField!
    
    @IBOutlet weak var changeTextLabel: UILabel!
    
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
        checkTextField.backgroundC = 
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
        return nil
    } // check if the text field are filled in
    
    func onlyUserLogIn() -> Bool {
        if accountTextField.text == "appworks_school@gmail.com" && passwordTextField.text == "1234" && inputTypeSegment(<#T##sender: UISegmentedControl##UISegmentedControl#>) {
            return true
        }
        return false
    } //check if the log in info. is correct
    
    @IBAction func processButton(_ sender: UIButton) {
        let rightUser = onlyUserLogIn()
        print(onlyUserLogIn())
        
        let emptyField = validateField()
        
        if rightUser == false {
            let alert = UIAlertController(title: "Error", message: "Login fail.", preferredStyle: .alert) // worng log in information
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } // check if log in info is correct
        
        if emptyField != nil {
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

//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//
//        return true
//
//    }
//}
