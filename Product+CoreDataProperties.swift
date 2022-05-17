//
//  Product+CoreDataProperties.swift
//  
//
//  Created by Neo on 2022/5/16.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var avg: Double
    @NSManaged public var price: Double

}
