//
//  WSRProduct.swift
//  POCiOS
//
//  Created by boufaied youssef on 01/11/2017.
//  Copyright © 2017 boufaied youssef. All rights reserved.
//

import Foundation
public class WSRProduct {
    
    
    public func parseProduct(itemDictionary:NSDictionary)->Product{
        let product : Product = Product()
        let name = itemDictionary["productName"] as! String
        let image = itemDictionary["imageUrl"] as! String
        let productmaterial = itemDictionary["productMaterial"] as! String
        let brand = itemDictionary["brand"] as! String
        let details = itemDictionary["details"] as! String
        let price = itemDictionary["basePrice"] as! String
        let reviews = itemDictionary["reviews"] as! NSArray
        
        for review in reviews {
            let reviewMain : Review = Review()
            let reviewItem = review as! NSDictionary
            reviewMain.content = reviewItem["content"] as! String
            reviewMain.rating = reviewItem["rating"] as! Int
            product.listReviews.append(reviewMain)
        }
        product.name = name
        product.image = image
        product.material = productmaterial
        product.brand = brand
        product.details = details
        product.price = price
        
        
        return product
    }
}
