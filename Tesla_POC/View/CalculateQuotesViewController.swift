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
            print("Please Enter your correct Name")
            lblDisplayQuote.text = "Please Enter your Name"
            return
        }
        guard let phone = txtfPhone.text , validation.isValidPhone(phone: phone) else {
            print("Please Enter Your correct Phone Number")
            lblDisplayQuote.text = "Please Enter Your Phone Number"
            return
        }
        guard let email = txtfEmail.text ,validation.isValidEmail(email: email) else {
            print("Please Enter your Email ID")
            lblDisplayQuote.text = "Please Enter your Email ID"
            return
        }
        guard let premiumAmount = txtfAmount.text, !premiumAmount.isEmpty else {
                      print("Enter AMount")
                    lblDisplayQuote.text = "Please Enter Premium Amount"
                      return
                  }
        guard let numberInstalment = txtfInstalment.text, !numberInstalment.isEmpty else {
                     print("ENter number of Instalment")
            lblDisplayQuote.text = "Please Enter No of Instalment"
                      return
                  }
                  guard let amount = Double(premiumAmount), amount >= 0 else {
                     print("Amount should be greter than 0")
                      lblDisplayQuote.text = "Premium AMount Should be greater than 0"
                      return
                  }
                  guard let instlment = Double(numberInstalment), instlment > 0 else {
                      
                      return
                  }
                  let calculation = amount/instlment
                  lblDisplayQuote.text = "The instalment per month will be \(calculation)"
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
