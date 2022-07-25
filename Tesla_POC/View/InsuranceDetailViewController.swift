//
//  InsuranceDetailViewController.swift
//  Tesla_POC
//
//  Created by user218980 on 7/22/22.
//

import UIKit

class InsuranceDetailViewController: UIViewController {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblDetails:UILabel!
    @IBOutlet weak var btnFindQuotes:UIButton!
    
    var navigateFrom = String()
    var setRefrenceNavController :UINavigationController?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = "\(navigateFrom) Insurance"
        Utilities.styleFilledButton(btnFindQuotes)
        showDetails()
        // Do any additional setup after loading the view.
    }
    func showDetails()
    {
        switch navigateFrom {
        case "Home":
            lblDetails.text = "Covers loss or damage to building and contents against perils mentioned in our Fire & Allied perils.The insurance by this policy applies also to contents temporarily removed and during transit as accompaniedbaggage anywhere in India to other premises used for temporary residence wherein the insured shall have placed any of such property in safe during his temporary absence from the insured premises during any period not exceeding in the aggregate, one hundred and twenty (120) days in any one period of insurance, provided thatthe liability of the company in respect of property so removed shall not exceed one tenth (1/10) of the total sum insured under this section."
        case "Life":
            lblDetails.text = "Life insurance is the best way to create wealth & secure family’s future in the event of unfortunate death of the policyholder. Life insurance can be availed either through “Term plans” that offer life cover for family’s protection or through “Investment Plans” that help in wealth creation with financial security to meet individuals financial goals"
        case "Medical":
            lblDetails.text = "Health insurance is meant to provide financial cover against hospitalization costs, prescription fees,medical bills, etc. With soaring medical bills and hospitalization costs, buying health insurance has become more than just an option; it has become a necessity if you seek the best medical care without worrying about the financial strain it might bring on your wallet. One can get health insurance against regular premium payments."
        case "Motar":
            lblDetails.text = "Motor vehicle which includes private cars Motorised Two wheelers and Commercial vehicles excluding vehicles running on rails. \n Who can Insure ? \n i· Owners of the vehicle Financiers or Lessee who have insurable interest in a motor vehicle.\n  Insured's Declared Value (IDV) \n (a) In case of vehicle not exceeding 5 years of age the IDV has to be arrived at by applying the percentage of depreciation specified in the tariff on the showroom price of the particular make and model of the vehicle.\n (b) In case of vehicles exceeding 5 years of age and Obsolete models (manufacture of those vehicles which have been stopped by the manufacturers) they have to be insured for the prevailing market value of the same as agreed to between the insurer and the insured."
        default:
            break
        }
    }
    
    //MARK:- API
    func getInsuranceData()
    {
        let uriString = "https://62d910275d893b27b2dd4440.mockapi.io/data"
        let url = URL(string: uriString)!
        let apiController = HttpUtility()
        apiController.getData(urlString: url) { response, error in
            if response != nil
            {
                let data = response
                print(data,"API Response")
            }
        }
    }

    @IBAction func btnFindQuotation(_ sender: UIButton) {
        let calculateQuoVC = self.storyboard?.instantiateViewController(withIdentifier: "CalculateQuoteViewController") as! CalculateQuoteViewController
        self.navigationController?.pushViewController(calculateQuoVC, animated: true)
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
