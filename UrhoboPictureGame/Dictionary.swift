//
//  Dictionary.swift
//  UrhoboPictureGame
//
//  Created by Ufuoma Okoro on 28/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import CoreData


class Dictionary:   NSManagedObject {
    
    @NSManaged var englishName: String
    @NSManaged var urhoboName: String
    @NSManaged var imageName:   String
    
    
}
