//
//  Challenge.swift
//  challenge1
//
//  Created by 노을 on 3/29/26.
//

import Foundation

struct Challenge: Identifiable, Codable {
    let id: UUID
    let date: Date
    let title: String
}

