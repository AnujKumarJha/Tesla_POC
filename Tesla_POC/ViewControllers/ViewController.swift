//
//  ViewController.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 19/07/22.
//

import UIKit

struct User:Decodable{
    let entries:[Entries]
}
struct Entries:Decodable
{
    let API:String,	Description:String,	Auth:String,Category:String
}
class UserTableViewCell:UITableViewCell
{
    @IBOutlet weak var BaseVW:UIView!
    @IBOutlet weak var lblApi:UILabel!
    @IBOutlet weak var lblDesc:UILabel!
    @IBOutlet weak var lblAuth:UILabel!
    @IBOutlet weak var lblCategory:UILabel!
    
}
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tblData: UITableView!
    
    var arrEntries = [Entries]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JsonParse()
        // Do any additional setup after loading the view.
    }
    func JsonParse()
      {
          let urlstring = "https://api.publicapis.org/entries"
          let url:URL = URL(string: urlstring)!
          let session:URLSession = URLSession(configuration: .default)
          let dataTask = session.dataTask(with: url) { (data, response, error) in
              if response != nil
              {
                  if data != nil
                  {
                      do
                      {
                          let dictionary = try JSONDecoder().decode(User.self, from: data!)
                          self.arrEntries = dictionary.entries
                         // print(self.arrEntries)
                          
                          DispatchQueue.main.async {
                              self.tblData.reloadData()

                          }
                          }
                          
                      
                      catch
                      {
                          print(error.localizedDescription)
                      }
                  }
                  else
                  {
                      print("data not found \(error?.localizedDescription)")
                  }
              }
              
          }
          
          dataTask.resume()
      }
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return arrEntries.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tblData.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
          
          let dict = arrEntries[indexPath.row]
          print(dict)
          cell.lblApi.text = dict.API
          cell.lblDesc.text = dict.Description
         // cell.lblAuth.text = dict.Auth
          cell.lblCategory.text = dict.Category
      
          let auth = dict.Auth
          if auth.count == 0
          {
              cell.lblAuth.text = "-"
          }else{
              cell.lblAuth.text = auth
          }
          
          return cell
      }
      

}

