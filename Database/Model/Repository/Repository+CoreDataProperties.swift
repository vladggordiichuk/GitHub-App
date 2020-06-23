//
//  Repository+CoreDataProperties.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Repository {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Repository> {
        return NSFetchRequest<Repository>(entityName: "Repository")
    }

    @NSManaged public var title: String?
    @NSManaged public var avatar: URL?
    @NSManaged public var url: URL?
    @NSManaged public var language: String?
    @NSManaged public var descr: String?
    @NSManaged public var updatedAt: Date?

}
