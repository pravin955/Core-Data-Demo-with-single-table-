//
//  AuthorManager.swift
//  CoreData Demo
//
//  Created by Pravinkumar on 06/07/21.
//

import Foundation
import CoreData

struct AuthorManager {
    
    var authorDataRepo = AuthorDataRepository()
    
    func create(author: AuthorModel) {
        authorDataRepo.create(author: author)
    }
    
    func getAll() -> [AuthorModel]? {
        return authorDataRepo.getAll()
    }
    
    func get(byIdentifier id: UUID) -> AuthorModel? {
        return authorDataRepo.get(byIdentifier: id)
    }
    
    func update(author: AuthorModel) -> Bool {
        return authorDataRepo.update(author: author)
    }
    
    func delete(record: AuthorModel) -> Bool {
        return authorDataRepo.delete(record: record)
    }
    
}
