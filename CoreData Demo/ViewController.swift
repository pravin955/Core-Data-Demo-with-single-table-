//
//  ViewController.swift
//  CoreData Demo
//
//  Created by Pravinkumar on 01/07/21.
//

import UIKit

class ViewController: UIViewController {

    var manager: AuthorManager = AuthorManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls)
        createAuthor()
        fetchAuthors()
    }
    
    private func createAuthor() {
        manager.create(author: AuthorModel(firstName: "Pravya", lastName: "Shri", id: UUID()))
    }
    
    private func fetchAuthors() {
        let allAuthors = manager.getAll()
        allAuthors? .forEach({ (author) in
            print(author.firstName!)
        })
        
    }
}
