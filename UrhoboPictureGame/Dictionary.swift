//
//  Dictionary.swift
//  UrhoboPictureGame
//
//  Created by Ufuoma Okoro on 28/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import CoreData


class Dictionary:   NSManagedObject {
    
    @NSManaged var id: Int
    @NSManaged var englishName: String
    @NSManaged var urhoboName: String
    @NSManaged var imageName:   String
    
    
}

class DictionaryWords: ObservableObject {
    
    @Published var id = 0
    @Published var englishName = ""
    @Published var urhoboName = ""
    @Published var imageName = ""
    
}
