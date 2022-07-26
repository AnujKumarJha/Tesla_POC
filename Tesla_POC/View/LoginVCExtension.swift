//
//  LoginVCExtension.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 25/07/22.
//

import Foundation
import UIKit

extension LoginViewController : LoginViewModelDelegate
{
    func didReceiveLoginResponse(loginResponse: LoginResponse?){

        if(loginResponse?.errorMessage == nil && loginResponse?.data != nil)
        {
            debugPrint("navigate to different view controller")
        }
        else if (loginResponse?.errorMessage != nil)
        {
            let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: loginResponse?.errorMessage, preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))

            self.present(alert, animated: true)
        }
    }
}

