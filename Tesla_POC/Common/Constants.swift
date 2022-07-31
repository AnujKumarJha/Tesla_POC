//
//  Constants.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 22/07/22.
//

import Foundation

struct Constants {
    
    static let ErrorAlertTitle = "Info"
    static let OkAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
    static let arrProductImage = ["home_insurance","car_insurance","health_insurance","family_insurance","fire_insurance","travel_insurance"]
    static let alertInfo = "Please enter email and password"
    static let validAlertInfo = "Please enter valid email and password"
    static let headerTitle = "TESLA"
    static let loginHeaderTitle = "Login"
    static let reigsterHeaderTtile = "Registration"
    static let reigsterSubmitTile = "Succesfully Register completed"
    static let users = "users"
    static let firstname = "firstname"
    static let lastname = "lastname"
    static let uid = "uid"
    
    
    struct Storyboard  {
        static let productListViewController = "ProductListVC"
    }
}


struct ApiEndpoints
{
    static let insurance = "http://demo0333988.mockable.io/Employees"
    static let productList =  "https://demo2197219.mockable.io/"
}
