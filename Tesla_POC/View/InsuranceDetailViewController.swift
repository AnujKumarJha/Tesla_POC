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
  
    var navigateFrom : ProductList?
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
      
        Utilities.styleFilledButton(btnFindQuotes)
        lblName.text = navigateFrom?.name
        lblCompany.text = navigateFrom?.company
        lblDescription.text = navigateFrom?.description
        let url = URL(string: navigateFrom!.imageUrl ?? "")
        let data = try? Data(contentsOf: url!)

        if let imageData = data {
            imgVW.image = UIImage(data: imageData)
        }
        // Do any additional setup after loading the view.
    }

      //MARK:- API
    

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
