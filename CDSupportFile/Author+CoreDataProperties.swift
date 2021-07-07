//
//  Author+CoreDataProperties.swift
//  CoreData Demo
//
//  Created by Pravinkumar on 05/07/21.
//
//

import Foundation
import CoreData


extension Author {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var authorId: UUID?
    
    func getSingleAuthor() -> AuthorModel {
        return AuthorModel(firstName: self.firstname, lastName: self.lastname, id: self.authorId)
    }

}

extension Author : Identifiable {

}
