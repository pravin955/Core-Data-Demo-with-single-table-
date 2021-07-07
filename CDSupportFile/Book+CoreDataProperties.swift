//
//  Book+CoreDataProperties.swift
//  CoreData Demo
//
//  Created by Pravinkumar on 05/07/21.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var pages: Int64
    @NSManaged public var publicationDate: Date?
    @NSManaged public var title: String?
    @NSManaged public var bookId: Int16
    @NSManaged public var library: Library?

}

extension Book : Identifiable {

}
