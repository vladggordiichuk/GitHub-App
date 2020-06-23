 //
//  PersistenceManager.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import Foundation
import CoreData


final class PersistenceManager {
    
    private init() { }
    
    static let shared = PersistenceManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GitHub_App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func save () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func clearCache() {
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Repository")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        
        do {
            try PersistenceManager.shared.context.execute(request)
        } catch {
            print(error.localizedDescription)
        }
    }
}
