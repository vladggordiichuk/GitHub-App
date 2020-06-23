//
//  Repository+CoreDataClass.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//
//

import Foundation
import CoreData


public class Repository: NSManagedObject, Decodable {
    
    fileprivate enum CodingKeys: String, CodingKey {
        case title = "full_name"
        case owner
        case url = "html_url"
        case description, language
        case updatedAt = "updated_at"
    }
    
    fileprivate enum OwnerCodingKeys: String, CodingKey {
        case avatar = "avatar_url"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Repository", in: PersistenceManager.shared.context) else { fatalError("Failed to decode Repository") }

        self.init(entity: entity, insertInto: PersistenceManager.shared.context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decodeIfPresent(String.self, forKey: .title)
        
        if let ownerContainer = try? container.nestedContainer(keyedBy: OwnerCodingKeys.self, forKey: .owner) {
            let avatarString = try ownerContainer.decodeIfPresent(String.self, forKey: .avatar)
            avatar = avatarString == "" ? nil : URL(string: avatarString!)
        }
        
        language = try! container.decodeIfPresent(String.self, forKey: .language)
        
        let projectUrlString = try container.decodeIfPresent(String.self, forKey: .url)
        url = URL(string: projectUrlString ?? "")
        
        descr = try container.decode(String.self, forKey: .description)
        
        if let updatedAtString = try container.decodeIfPresent(String.self, forKey: .updatedAt) {
            let dateFormatter = ISO8601DateFormatter()
            updatedAt = dateFormatter.date(from: updatedAtString)
        }
        
    }
}

public extension CodingUserInfoKey {
    // Helper property to retrieve the context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}
