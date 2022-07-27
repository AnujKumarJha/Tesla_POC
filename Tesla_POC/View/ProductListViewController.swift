//
//  ProductListViewController.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 22/07/22.
//

import UIKit
class ProductListCollectionViewCell:UICollectionViewCell
{
    @IBOutlet weak var baseVw:UIView!
    @IBOutlet weak var lblProductName:UILabel!
    @IBOutlet weak var imgVWProduct:UIImageView!
}
class ProductListViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collVwProduct:UICollectionView!
    
    let arrProduct = ["Home","Life","Medical","Motar"]
    let arrProductImage = ["home","life","medical","motar"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Product"
        // Do any additional setup after loading the view.
    }
    //Mark: - CollectionView DataSource and Delegate Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collVwProduct.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductListCollectionViewCell
        
        cell.baseVw.backgroundColor =  #colorLiteral(red: 0.2143889368, green: 0.7209745049, blue: 0.4636286497, alpha: 1)
        cell.lblProductName.text = arrProduct[indexPath.row]
        cell.imgVWProduct.image = UIImage(named: arrProductImage[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let prod = arrProduct[indexPath.row]
       
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "InsuranceDetailViewController") as! InsuranceDetailViewController

        vc.navigateFrom = prod

        self.navigationController?.pushViewController(vc, animated: true)
         
        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwProduct.bounds.size.width, height: collVwProduct.bounds.size.height/4)
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
