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
    private var loginViewModel = loginViewodel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.loginHeaderTitle
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
        // Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    @IBAction func loginButtonAction(_ sender: Any) {
        let email = emailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        //Login Validation
        if (email?.isEmpty == true) || (password?.isEmpty == true){
            Utilities.Alert.present(title:Constants.ErrorAlertTitle, message:Constants.alertInfo, from:self)
        }
        else if Utilities.ValidateEmailString(strEmail:email as Any) == false && Utilities.isPasswordValid(password!) == false
        {
            Utilities.Alert.present(title:Constants.ErrorAlertTitle, message: Constants.validAlertInfo, from:self)
        }
        else
        {
            loginViewModel.authenticateUser(email:email!, password: password!) { status,error in
                guard let err = error , status == false
                else{
                    let productListVC =  self.storyboard?.instantiateViewController(withIdentifier:Constants.Storyboard.productListViewController) as! ProductListViewController
                    self.view.window?.rootViewController = productListVC
                    self.view.window?.makeKeyAndVisible()
                    return
                }
                Utilities.Alert.present(title:Constants.ErrorAlertTitle,message:err,from:self)
            }
           
        }
    }
    
    
}






