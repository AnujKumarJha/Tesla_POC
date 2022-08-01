//
//  CalculateQuotesViewController.swift
//  Tesla_POC
//
//  Created by user218980 on 7/25/22.
//

import UIKit

class CalculateQuotesViewController: UIViewController {

    @IBOutlet weak var txtfName:UITextField!
    @IBOutlet weak var txtfPhone:UITextField!
    @IBOutlet weak var txtfEmail:UITextField!
    @IBOutlet weak var txtfAmount:UITextField!
    @IBOutlet weak var txtfInstalment:UITextField!
    @IBOutlet weak var lblDisplayQuote:UILabel!
    @IBOutlet weak var btnCalculation:UIButton!
    
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quotation"
        lblDisplayQuote.isHidden = true
        Utilities.styleTextField(txtfName)
        Utilities.styleTextField(txtfPhone)
        Utilities.styleTextField(txtfEmail)
        Utilities.styleTextField(txtfAmount)
        Utilities.styleTextField(txtfInstalment)
        Utilities.styleFilledButton(btnCalculation)
       
        // Do any additional setup after loading the view.
    }
    func calculation()
    {
       
        guard let name = txtfName.text , validation.isValidName(name: name) else  {
            alertControllerAction(alertTitle: "Name", alertMessage: Constants.alertNameError, vc: self)
            return
        }
        guard let phone = txtfPhone.text , validation.isValidPhone(phone: phone) else {
            alertControllerAction(alertTitle: "Phone Number", alertMessage: Constants.alertPhoneNumber, vc: self)
            return
        }
        guard let email = txtfEmail.text ,validation.isValidEmail(email: email) else {
            alertControllerAction(alertTitle: "Email ID", alertMessage: Constants.alertEmailError, vc: self)
            return
        }
        guard let premiumAmount = txtfAmount.text, !premiumAmount.isEmpty else {
            alertControllerAction(alertTitle: "Premium Amount", alertMessage: Constants.alertPremiumAmountError, vc: self)
                      return
                  }
        guard let numberInstalment = txtfInstalment.text, !numberInstalment.isEmpty else {
            alertControllerAction(alertTitle: "Instalment", alertMessage: Constants.alertInstalmentError, vc: self)
                      return
                  }
                  guard let amount = Double(premiumAmount), amount >= 0 else {
                      alertControllerAction(alertTitle: "Premium Amount", alertMessage: "Premium Amount Should be greater than 0", vc: self)
                      return
                  }
                  guard let instlment = Double(numberInstalment), instlment > 0 else {
                      
                      return
                  }
                  let calculation = amount/instlment
                  lblDisplayQuote.text = "The instalment per month will be \(calculation)"
        alertControllerAction(alertTitle: "Quotation", alertMessage: "The instalment per month will be \(calculation)", vc: self)
    }
    @IBAction func btnCalculate(_ sender: Any) {
        lblDisplayQuote.isHidden = false
        calculation()
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
