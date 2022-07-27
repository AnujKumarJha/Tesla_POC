//
//  LoginValidation.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 22/07/22.
//

import Foundation

struct LoginValidation {
    func Validate(loginRequest:LoginRequest) -> ValidationResult
    {
        if loginRequest.userEmail!.isEmpty

        {
            return ValidationResult(success: false, error: "User email is empty")
        }
        if loginRequest.userPassword!.isEmpty
        {
            return ValidationResult(success: false, error: "user Paswweord is empty")
        }
        
        return ValidationResult(success: true, error: nil)
    }
}
