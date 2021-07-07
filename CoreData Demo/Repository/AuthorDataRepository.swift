//
//  AuthorDataRepository.swift
//  CoreData Demo
//
//  Created by Pravinkumar on 05/07/21.
//

import Foundation
import CoreData

protocol AuthorRepository {
    
    func create(author: AuthorModel)
    func getAll() -> [AuthorModel]?
    func get(byIdentifier id: UUID) -> AuthorModel?
    func update(author: AuthorModel) -> Bool
    func delete(record: AuthorModel) -> Bool
}

struct AuthorDataRepository: AuthorRepository {
    func create(author: AuthorModel) {
        
        let authors = Author(context: DataManager.shared.context)
        authors.firstname = author.firstName
        authors.lastname = author.lastName
        authors.authorId = author.id

        DataManager.shared.saveContext()
    }
    
    func getAll() -> [AuthorModel]? {
        
        let allAuthors = DataManager.shared.getAllData(managedObject: Author.self)
        
        var getAuthors: [AuthorModel] = []
       
        allAuthors?.forEach({ (author) in
            getAuthors.append(author.getSingleAuthor())
        })
        return getAuthors
    }
    
    func get(byIdentifier id: UUID) -> AuthorModel? {
        
        let getAuthor = fetchRecordById(byIdentifier: id)
        guard getAuthor != nil else { return nil }
        return getAuthor?.getSingleAuthor()
        
    }
    
    func update(author: AuthorModel) -> Bool {
        
        let updateData = fetchRecordById(byIdentifier: author.id!)
        guard updateData != nil else { return false }
        updateData?.firstname = author.firstName
        updateData?.lastname = author.lastName
        DataManager.shared.saveContext()
        
        return true
    }
    
    func delete(record: AuthorModel) -> Bool {
        
        let deleteData =  fetchRecordById(byIdentifier: record.id!)
        guard deleteData != nil else { return false }
        DataManager.shared.context.delete(deleteData!)
        return true
    }
    
    func fetchRecordById(byIdentifier id: UUID) -> Author? {
        
        let getAuthor =  NSFetchRequest<Author>(entityName: "Author")
        let predicate = NSPredicate(format: "id == %@", id as CVarArg)
        getAuthor.predicate = predicate
        do {
            let authorById = try DataManager.shared.context.fetch(getAuthor).first
            guard authorById != nil else { return nil }
            return authorById
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
}
