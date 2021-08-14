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
    
//    func validateField() -> String? {
//
//        if accountTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
//
//            return "Please fill all fields."
//        }
//
//        return nil
//    } // check if all the text fields are filled in
    
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
    
    
    @IBAction func processButton(_ sender: UIButton) {
        let errorField = validateField()
        if errorField == "Account" {
            let alert = UIAlertController(title: "Error", message: "Account should not be empty.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } else if errorField == "Password" {
            let alert = UIAlertController(title: "Error", message: "Password should not be empty.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
        } else if errorField == "Check" {
            let alert = UIAlertController(title: "Error", message: "Check should not be empty.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alert.addAction(action)
            present(alert, animated:  true)
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
