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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quotation"
        lblDisplayQuote.isHidden = true
        Utilities.styleFilledButton(btnCalculation)
        // Do any additional setup after loading the view.
    }
    func calculation()
    {
        
        guard let name = txtfName.text , !isValidName(name: name) else  {
            print("Please Enter your correct Name")
            lblDisplayQuote.text = "Please Enter your Name"
            return
        }
        guard let phone = txtfPhone.text , !isValidPhone(phone: phone) else {
            print("Please Enter Your correct Phone Number")
            lblDisplayQuote.text = "Please Enter Your Phone Number"
            return
        }
        guard let email = txtfEmail.text ,!isValidEmail(email: email) else {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
