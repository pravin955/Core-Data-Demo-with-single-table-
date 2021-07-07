//
//  DataManager.swift
//  CoreData Demo
//
//  Created by Pravinkumar on 03/07/21.
//

import Foundation
import CoreData

final class DataManager {
    
    private init() {}
    static let shared = DataManager()
  
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context =  persistentContainer.viewContext

    // MARK: - Core Data Saving support

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Fetch Data Support
    // MARK: -
    
    func getAllData<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        
        do {
            guard let result = try DataManager.shared.context.fetch(managedObject.fetchRequest()) as? [T] else { return nil }
            
            return result
            } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
}
