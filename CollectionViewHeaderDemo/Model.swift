//
//  Model.swift
//  CollectionViewHeaderDemo
//
//  Created by Mufakkharul Islam Nayem on 5/4/20.
//  Copyright © 2020 Mufakkharul Islam Nayem. All rights reserved.
//

import Foundation

enum ProfileViewModelItemType {
    case friends
    case families
}

protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var sectionTitle: String { get }
    var rowCount: Int { get }
}

struct ProfileViewModel {
    var items = [ProfileViewModelItem]()
    
    init() {
        let friends = ViewModelFriendsItem(friends: [ Friend(), Friend(), Friend(), Friend(), Friend(), Friend(), Friend(), Friend(), Friend(), Friend() ])
        items.append(friends)
        
        let families = ViewModelFamiliesItem(families: [ Family(), Family(), Family(), Family(), Family(), Family() ])
        items.append(families)
    }
}

struct ViewModelFriendsItem: ProfileViewModelItem {
    
    let friends: [Friend]
    
    var type: ProfileViewModelItemType {
        return .friends
    }
    
    var sectionTitle: String {
        return "Friends"
    }
    
    var rowCount: Int {
        return friends.count
    }
    
}

struct ViewModelFamiliesItem: ProfileViewModelItem {
    
    let families: [Family]
    
    var type: ProfileViewModelItemType {
        return .families
    }
    
    var sectionTitle: String {
        return "Familie Members"
    }
    
    var rowCount: Int {
        return families.count
    }
}

struct Friend {
    
}

struct Family {
    
}
