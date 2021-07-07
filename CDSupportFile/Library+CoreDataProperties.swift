//
//  Library+CoreDataProperties.swift
//  CoreData Demo
//
//  Created by Pravinkumar on 05/07/21.
//
//

import Foundation
import CoreData


extension Library {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Library> {
        return NSFetchRequest<Library>(entityName: "Library")
    }

    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var libraryId: Int16
    @NSManaged public var book: Book?

}

extension Library: Identifiable {

}
