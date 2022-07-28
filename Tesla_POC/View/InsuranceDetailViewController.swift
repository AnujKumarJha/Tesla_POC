//
//  InsuranceDetailViewController.swift
//  Tesla_POC
//
//  Created by user218980 on 7/22/22.
//
struct InsuranceData:Decodable
{
    let home,Life,motar,Health:String
}
import UIKit
class InsuranceDetailTableViewCell:UITableViewCell
{
    @IBOutlet weak var vwBase:UIView!
    @IBOutlet weak var lblDetails:UILabel!
}
class InsuranceDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblDetails:UILabel!
    @IBOutlet weak var btnFindQuotes:UIButton!
    
    @IBOutlet weak var tblInsuranceDetail:UITableView!
    var navigateFrom = String()
   
    var arrDetails = [InsuranceData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        lblTitle.text = "\(navigateFrom) Insurance"
        Utilities.styleFilledButton(btnFindQuotes)
        
        getInsuranceDetail { status in
            print(status)
        }
        // Do any additional setup after loading the view.
    }
    //MARK:- UITableView Delegate and DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrDetails.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblInsuranceDetail.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InsuranceDetailTableViewCell
        let dict = arrDetails[indexPath.row]
        print(arrDetails,"dshgfdfgkufh")
        switch navigateFrom {
        case "Home":
            cell.lblDetails.text = dict.home
        case "Life":
            cell.lblDetails.text = dict.Life
        case "Medical":
            cell.lblDetails.text = dict.Health
        case "Motar":
            cell.lblDetails.text = dict.motar
        default:
            break
        }
        return cell
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
