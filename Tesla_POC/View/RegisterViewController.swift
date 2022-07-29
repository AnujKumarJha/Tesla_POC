//
//  RegisterViewController.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 20/07/22.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
        // Hide the error label
        errorLabel.alpha = 0
        // Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(registerButton)
    }
  
    // Check the fields and validate that the data is correct.If everything is correct,this method return nil.Otherwise,it return he error message
    func validateFields() -> String? {
        //Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        if  Utilities.isPasswordValid(cleanedPassword) == false {
            //Password is not secure enough
            return "Please make sure your password is at leasr 8 character,contain ascpecail character and a number."
        }
         return nil
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
              // Validate the fields
        let error = validateFields()
        if error != nil {
            // There is something wrog the fields,show error message
            showError(error!)
        }
        else {
            //Created clenaed veriosn of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
            //Create the user
            
            Auth.auth().createUser(withEmail:email, password:password) { result, err in
                // Check for errors
                if  err != nil {
                    //  There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    // User was created successfull,now store the first name and last name
                    let db =  Firestore.firestore()
                    db.collection("users").addDocument(data:["firstname":firstName,"lastname":lastName,"uid":result?.user.uid]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                        
                    }
                    //Transition to the home screen
                    self.transitionToHome()
                }
            }
           
        }
              // Create the user
              // Transition to the home screen
    }
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToHome()
    {
       let productListVC =  storyboard?.instantiateViewController(withIdentifier:Constants.Storyboard.productListViewController) as! ProductListViewController
        navigationController?.pushViewController(productListVC, animated: true)
       // view.window?.rootViewController = productListVC
       // view.window?.makeKeyAndVisible()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
