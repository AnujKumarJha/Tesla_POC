//
//  LoginViewModel.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 22/07/22.
//

import Foundation
import FirebaseAuth

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponse?)
}

struct loginViewodel {
    var delegate : LoginViewModelDelegate?
   
    func authenticateUser(email:String ,password:String, callBack:@escaping(_ status:Bool,_ error:String?)->Void) {
        let loginRequest = LoginRequest(userEmail:email, userPassword: password)
        let loginValidation = LoginValidation().Validate(loginRequest:loginRequest)
        if (loginValidation.success) {
            Auth.auth().signIn(withEmail:email, password:password) { result,error in
                if error != nil {
                    callBack(true,nil)
                }
                else {
                    callBack(false,error?.localizedDescription)
                }
            }
        }
        else {
            self.delegate?.didReceiveLoginResponse(loginResponse:LoginResponse(errorMessage:loginValidation.error, data:nil ))
        }
      
        
        
    }
}
