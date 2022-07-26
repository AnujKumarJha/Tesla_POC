//
//  LoginViewModel.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 22/07/22.
//

import Foundation
import FirebaseAuth
import Firebase

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

struct loginViewodel {
    var delegate : LoginViewModelDelegate?
   
    func authenticateUser(email:String ,password:String, callBack:@escaping(_ status:Bool,_ error:String?)->Void) {
            Auth.auth().signIn(withEmail:email, password:password) { result,error in
                if error != nil {
                    callBack(false,error?.localizedDescription)
                }
                else {
                  
                    callBack(true,nil)
                }
            }
    }
}
func getProductList(completionHander:@escaping(Bool,[ProductList])->())
{
//let urlString = "https://demo2197219.mockable.io/"
    let urlString = ApiEndpoints.productList
    let url = URL(string: urlString)!
    let apiController = HttpUtility()
    apiController.getApiData(requestUrl: url, resultType: [ProductList].self) { result in
        if result != nil
        {
            print(result as Any)
            completionHander(true ,result!)
           
        }
    }
}


struct Validation {
func isValidEmail(email:String) -> Bool
   {
       let email_reg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
       
       let email_test = NSPredicate(format: "SELF MATCHES %@", email_reg)
       return email_test.evaluate(with: email)
   }
   func isValidPassWord(passwd:String) -> Bool
   {
       let pass_test = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{3,}")
       return pass_test.evaluate(with: passwd)
   }
   func isValidName(name:String) -> Bool
   {
       let RegEx = "\\A\\w{3,18}\\z"
       let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
       return Test.evaluate(with: name)
   }
   func isValidPhone(phone: String) -> Bool {
       
       let phoneRegex = "^(?:(?:\\+|0{0,2})91(\\s*[\\-]\\s*)?|[0]?)?[6789]\\d{9}$";
       let valid = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phone)
       return valid

   }
}
