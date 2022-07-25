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

        lblDisplayQuote.isHidden = true
        Utilities.styleFilledButton(btnCalculation)
        // Do any additional setup after loading the view.
    }
    func calculation()
    {
       
     
                guard let premiumAmount = txtfAmount.text, !premiumAmount.isEmpty else {
                      print("Enter AMount")
                      return
                  }
        guard let numberInstalment = txtfInstalment.text, !numberInstalment.isEmpty else {
                     print("ENter number of Instalment")
                      return
                  }
                  guard let amount = Double(premiumAmount), amount >= 0 else {
                     print("Amount should be greter than 0")
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
