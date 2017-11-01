//
//  ProductsTableViewController.swift
//  Test
//
//  Created by boufaied youssef on 01/11/2017.
//  Copyright © 2017 boufaied youssef. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ProductsTableViewController: UITableViewController {
    
    var products : [Product] = [Product]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.estimatedRowHeight = 300
        self.tableView.rowHeight = UITableViewAutomaticDimension
        if(isInternetAvailable()){
        Alamofire.request("\(Utils.baseUrlProducts)", method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler:
            { response in
            
                if(response.response?.statusCode == 200){
                 if let data = response.result.value{
                    print("okay \(data)")
                    
                    let wsr:WSRProduct = WSRProduct()
                    var product : Product = Product()
                    let items = data as! NSArray
                    for item in items{
                    
                    product = wsr.parseProduct(itemDictionary: (item as! NSDictionary))
                    self.products.append(product)
                    self.tableView.reloadData()
                    }
                    
                }
            
                }
            
            
        })
        }else{
            print("internet not available")
            
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        
        let product : Product = products[indexPath.row]
        
        cell.productName.text = product.name
        cell.productBrand.text = product.brand
        cell.productPrice.text = "\(product.price)"
        cell.productCategory.text = product.category
        if(product.image != ""){
            cell.productImageView.sd_setImage(with: URL(string:product.image), placeholderImage: UIImage(named:"no_product"), options: [SDWebImageOptions.continueInBackground, SDWebImageOptions.highPriority, SDWebImageOptions.refreshCached, SDWebImageOptions.handleCookies, SDWebImageOptions.retryFailed]) { (image, error, cacheType, url) in
                if error != nil {
                    print("Failed: \(error)")
                } else {
                    print("Success")
                }
            }
        }
        
        // Configure the cell...

        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewcontroller : DetailProductViewController = storyboard.instantiateViewController(withIdentifier: "DetailProductViewController") as! DetailProductViewController
        viewcontroller.product = product
        self.navigationController?.show(viewcontroller, sender: nil)
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
