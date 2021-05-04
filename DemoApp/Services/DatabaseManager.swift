//
//  DatabaseManager.swift
//  DemoApp
//
//  Created by Ashutosh Srivastava on 16/03/21.
//

import Foundation
import CoreData
import UIKit

class DatabaseManager{
    private let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func addObj<T: NSManagedObject>(_ type: T.Type) -> T? {
        guard let entityName = T.entity().name else {return nil}
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: viewContext) else {return nil}
        let object = T(entity: entity, insertInto: viewContext)
        return object
    }
    
    func save(){
        do{
            try viewContext.save()
        } catch {
            print("error while saving Data: \(error)")
        }
    }
    
    func fetch<T: NSManagedObject>(_ type: T.Type) -> [T]{
        let request = T.fetchRequest()
        do {
            let result = try viewContext.fetch(request)
            return result as! [T]
        } catch {
            print("error in fetching data: \(error)")
            return []
        }
    }
    
    
}
