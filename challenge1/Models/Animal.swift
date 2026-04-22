//
//  Animal.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import Foundation

struct Animal: Identifiable{
    let id: UUID
    let namesByLevel: [Level: String]
    let descriptionByLevel: [Level: String]
    let imagesByLevel: [Level: String]
    
    func name(for level: Level) -> String {
        return namesByLevel[level] ?? "돌고래"
    }
    
    func image(for level: Level) -> String {
        return imagesByLevel[level] ?? "dolphin"
    }

    func description(for level: Level) -> String {
        return descriptionByLevel[level] ?? ""
    }

    /**
     static는 타입 자체에 속해서, Animal 인스턴스가 없어도 존재 가능
     */
    static let dolphin = Animal(
        id: UUID(),
        namesByLevel: [
            .egg:    "돌고래 알",
            .baby:   "아기 돌고래",
            .teen:   "청소년 돌고래",
            .adult:  "돌고래",
            .master: "마스터 돌고래"
        ],
        descriptionByLevel: [
            .egg:    "아직 세상에 나오지 않은 신비로운 존재",
            .baby:   "호기심 가득, 바다가 궁금해!",
            .teen:   "점점 빨라지는 꼬리핀의 박자",
            .adult:  "파도를 타며 자유롭게 누비는 중",
            .master: "바다를 지배하는 전설의 돌고래"
        ],
        imagesByLevel: [
            .egg:    "dolphin_egg",
            .baby:   "dolphin_baby",
            .teen:   "dolphin_teen",
            .adult:  "dolphin",
            .master: "dolphin_master"
        ]
    )
 }
