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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.reigsterHeaderTtile
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
        // Hide the error label
       
        // Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(registerButton)
    }
  
    // Check the fields and validate that the data is correct.If everything is correct,this method return nil.Otherwise,it return he error message
    
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let registerViewModel = registerViewModel()
        // registartion validation
        validateUser()
        let email = emailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines)
            registerViewModel.registrationUser(email:email!, password:password!) { (result , error) in
                if error != nil
                {
                    Utilities.Alert.present(title:Constants.ErrorAlertTitle,message:error!.debugDescription,from:self)
                }
                else {
                    let db = Firestore.firestore()
                    db.collection(Constants.users).addDocument(data:[Constants.firstname:self.firstNameTextField.text as Any,Constants.lastname:self.lastNameTextField.text as Any,Constants.uid:(result as AnyObject).user?.uid as Any]) { (error) in
                        if error != nil {
                            Utilities.Alert.present(title:Constants.ErrorAlertTitle,message:error!.localizedDescription,from:self)
                        }
                        else {
                            Utilities.Alert.present(title:Constants.ErrorAlertTitle,message:Constants.reigsterSubmitTile,from:self)
                        }
                    }
                }
    }
        
    func validateUser(){
        let email = emailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines)
        
        if (email?.isEmpty == true) || (password?.isEmpty == true)||(firstNameTextField.text?.isEmpty == true)||(lastNameTextField.text?.isEmpty == true) {
            Utilities.Alert.present(title:Constants.ErrorAlertTitle, message:Constants.alertInfo, from:self)
        }
        else if Utilities.ValidateEmailString(strEmail:email as Any) == false && Utilities.isPasswordValid(password!) == false
        {
            Utilities.Alert.present(title:Constants.ErrorAlertTitle, message: Constants.validAlertInfo, from:self)
        }
    }
    
    func transitionToHome()
    {
       let productListVC =  storyboard?.instantiateViewController(withIdentifier:Constants.Storyboard.productListViewController) as! ProductListViewController
        navigationController?.pushViewController(productListVC, animated: true)
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
}
