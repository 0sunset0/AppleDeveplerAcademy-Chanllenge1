//
//  Challenge.swift
//  challenge1
//
//  Created by 노을 on 3/29/26.
//

import Foundation
import SwiftData

@Model
class Challenge {
    var date: Date
    var title: String
    
    init(date: Date, title: String){
        self.date = date
        self.title = title
    }
}

