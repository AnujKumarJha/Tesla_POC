//
//  registerViewModel.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 31/07/22.
//

import Foundation
import FirebaseAuth
import Firebase

struct registerViewModel {
    func registrationUser(email:String ,password:String, callBack:@escaping(_ result:Any , _ error:String?)->Void) {
        Auth.auth().createUser(withEmail:email, password:password) { (result , error)  in
            // Check for erro
            if  error != nil {
                //  There was an error creating the user
                callBack(result?.user as Any,error!.localizedDescription)
            }
            else {
                callBack(result?.user as Any,nil)
            
         
            }
        }
    }
    
}
