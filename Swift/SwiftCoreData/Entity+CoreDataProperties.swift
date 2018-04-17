//
//  Entity+CoreDataProperties.swift
//  SwiftCoreData
//
//  Created by 李敏 on 2018/4/17.
//  Copyright © 2018年 Tongle. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var password: String?
    @NSManaged public var userName: String?

}
