//
//  PlayerClass.swift
//  Jacks
//
//  Created by Isaac Lyons on 7/6/20.
//  Copyright © 2020 Blizzard Skeleton. All rights reserved.
//

import Foundation

class Players {
    var name: String?
    var bid: Int?
    var tricks: Int?
    var position: Int?

    init(name: String, bid: Int, tricks: Int, position: Int) {
        self.name = name
        self.bid = bid
        self.tricks = tricks
        self.position = position
    }
    
    func sayName() -> String {
        return self.name!
    }
}

