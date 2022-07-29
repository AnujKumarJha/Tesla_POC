//
//  InsuranceDetailViewController.swift
//  Tesla_POC
//
//  Created by user218980 on 7/22/22.
//

import UIKit

class InsuranceDetailViewController: UIViewController{

    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblCompany:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var btnFindQuotes:UIButton!
    @IBOutlet weak var imgVW: UIImageView!
    
    @IBOutlet weak var tblInsuranceDetail:UITableView!
  
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
      
        Utilities.styleFilledButton(btnFindQuotes)
        
        getInsuranceDetail { status in
            print(status)
        }
        // Do any additional setup after loading the view.
    }

      //MARK:- API
    func getInsuranceDetail(onSuccess: @escaping(Bool) -> Void){
//    func getInsuranceDetail()
//    {
    let urlString = "https://demo1273074.mockable.io/insurance"
        let url = URL(string: urlString)!
        let apiController = HttpUtility()
        apiController.getApiData(requestUrl: url, resultType: [InsuranceData].self) { result in
            if result != nil
            {
                onSuccess(true)
                print(result as Any)
                self.arrDetails = result!
                DispatchQueue.main.async {
                    self.tblInsuranceDetail.reloadData()
                }
               
            }else{
                onSuccess(false)
            }
        }
    }
    

    @IBAction func btnFindQuotation(_ sender: UIButton) {
        let calculateQuoVC = self.storyboard?.instantiateViewController(withIdentifier: "CalculateQuotesViewController") as! CalculateQuotesViewController
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
