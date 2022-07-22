//
//  LoginRequest.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 22/07/22.
//

import Foundation

struct LoginRequest : Encodable
{
    var userEmail, userPassword: String?
}
