//
//  LoginViewController.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 20/07/22.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
        // Hide the error label
        errorLabel.alpha = 1
        // Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    @IBAction func loginButtonAction(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        let loginViewModel = loginViewodel()
        loginViewModel.authenticateUser(email: email, password: password) { status, error in
            guard let err = error , status == false else{
                let productListVC =  self.storyboard?.instantiateViewController(withIdentifier:Constants.Storyboard.productListViewController) as! ProductListViewController
                self.view.window?.rootViewController = productListVC
                self.view.window?.makeKeyAndVisible()
                return
            }
            self.errorLabel.text =  err
            self.errorLabel.alpha = 1
        }
            
        }
        
        
       
      
    }
    
    


