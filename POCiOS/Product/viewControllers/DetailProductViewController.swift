//
//  DetailProductViewController.swift
//  POCiOS
//
//  Created by boufaied youssef on 01/11/2017.
//  Copyright © 2017 boufaied youssef. All rights reserved.
//

import UIKit
import SDWebImage
class DetailProductViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var product : Product = Product()
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var ratingTableView: UITableView!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var materialLabel: UILabel!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageProduct: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = product.details
        materialLabel.text = product.material
        brandLabel.text = product.brand
        categoryLabel.text = product.category
        nameLabel.text = product.name
        priceLabel.text = product.price
        if(product.image != ""){
            imageProduct.sd_setImage(with: URL(string:product.image), placeholderImage: UIImage(named:"no_product"), options: [SDWebImageOptions.continueInBackground, SDWebImageOptions.highPriority, SDWebImageOptions.refreshCached, SDWebImageOptions.handleCookies, SDWebImageOptions.retryFailed]) { (image, error, cacheType, url) in
                if error != nil {
                    print("Failed: \(error)")
                } else {
                    print("Success")
                }
            }
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sectionsß
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return product.listReviews.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell:ReviewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewTableViewCell
        
        let review = product.listReviews[indexPath.row]
        cell.contentLabel.text = review.content
        cell.ratingLabel.text = "\(review.rating)"
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
