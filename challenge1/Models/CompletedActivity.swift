//
//  Activity.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import Foundation
/**
 Identifiable : 각 데이터를 고유하게 식별할 수 있다고 선언하는 프로토콜
 Codable: 데이터를 인코딩(저장) 하고 디코딩(불러오기) 할 수 있다고 선언하는 프로토콜
 */
struct CompletedActivity: Codable, Identifiable {
    let id: UUID
    let completedDate: Date
    let imageName: String
    let challenge: Challenge
}
