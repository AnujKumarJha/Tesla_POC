//
//  ProductViewController.swift
//  Tesla_POC
//
//  Created by user218980 on 7/20/22.
//

import UIKit

class ProductCollectionViewCell:UICollectionViewCell
{
    @IBOutlet weak var baseVW:UIView!
    @IBOutlet weak var lblProduct:UILabel!
    
}

class ProductViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
   
    @IBOutlet weak var collVwProduct:UICollectionView!
    
    let arrProduct = ["life","Home","Medical","Motar"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collVwProduct.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        cell.lblProduct.text = arrProduct[indexPath.row]
        return cell
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
