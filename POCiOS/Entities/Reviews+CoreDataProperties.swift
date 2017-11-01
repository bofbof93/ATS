//
//  Reviews+CoreDataProperties.swift
//  
//
//  Created by boufaied youssef on 01/11/2017.
//
//

import Foundation
import CoreData


extension Reviews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reviews> {
        return NSFetchRequest<Reviews>(entityName: "Reviews")
    }

    @NSManaged public var content: String?
    @NSManaged public var rating: String?

}
