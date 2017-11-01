//
//  Products+CoreDataProperties.swift
//  
//
//  Created by boufaied youssef on 01/11/2017.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var name: String?
    @NSManaged public var brand: String?
    @NSManaged public var category: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var details: String?
    @NSManaged public var material: String?

}
