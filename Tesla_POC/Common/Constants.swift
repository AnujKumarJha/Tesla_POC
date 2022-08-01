//
//  Constants.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 22/07/22.
//

import Foundation

struct Constants {
    
    static let ErrorAlertTitle = "Error"
    static let OkAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
    static let arrProductImage = ["home_insurance","car_insurance","health_insurance","family_insurance","fire_insurance","travel_insurance"]
    static let alertNameError = "Please Enter your correct Name"
    static let alertPhoneNumber = "Please Enter Your correct Phone Number"
    static let alertEmailError = "Please Enter your Email ID"
    static let alertPremiumAmountError = "Please Enter Premium Amount"
    static let alertInstalmentError = "Please Enter number of Instalments"
    struct Storyboard  {
       static let productListViewController = "ProductListVC"
    }
}


struct ApiEndpoints
{
    static let insurance = "http://demo0333988.mockable.io/Employees"
    static let productList = "https://demo2197219.mockable.io/"
}
