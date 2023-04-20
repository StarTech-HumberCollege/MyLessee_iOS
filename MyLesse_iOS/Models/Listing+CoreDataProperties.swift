//
//  Listing+CoreDataProperties.swift
//  MyLesse_iOS
//
//  Created by Liza Zhyr on 19/04/2023.
//
//

import Foundation
import CoreData


extension Listing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Listing> {
        return NSFetchRequest<Listing>(entityName: "Listing")
    }

    @NSManaged public var propertyType: String?
    @NSManaged public var buildingType: String?
    @NSManaged public var address: String?
    @NSManaged public var price: String?
    @NSManaged public var rooms: String?
    @NSManaged public var included: String?
    @NSManaged public var propDescription: String?
    @NSManaged public var photo1: Data?
    @NSManaged public var photo2: Data?
    @NSManaged public var photo3: Data?

}

extension Listing : Identifiable {

}
