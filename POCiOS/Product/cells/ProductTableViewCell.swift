//
//  TableViewCell.swift
//  TestTechnique
//
//  Created by boufaied youssef on 01/11/2017.
//  Copyright © 2017 youssef boufaied. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet var productBrand: UILabel!
    @IBOutlet var productCategory: UILabel!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
