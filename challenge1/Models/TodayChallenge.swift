//
//  Challenge.swift
//  challenge1
//
//  Created by 노을 on 3/29/26.
//

import Foundation
import SwiftData

@Model
class TodayChallenge {
    var date: Date
    var title: String
    var location: String
    var summary: String
    var tags: [String] = []
    var isCompleted: Bool = false
    
    init(date: Date, title: String, location: String, summary: String, tags: [String]) {
        self.date = date
        self.title = title
        self.location = location
        self.summary = summary
        self.tags = tags
    }
    
    func complete() {
        self.isCompleted = true
    }

    static let dummies: [TodayChallenge] = [
        TodayChallenge(
            date: Date.now,
            title: "영일대 1바퀴, 오늘의 나를 이겨봐",
            location: "영일대 해수욕장",
            summary: "포항 영일대해수욕장 해안을 따라 이어지는 약 4km의 러닝 코스.\n\n잔잔한 파도 소리와 함께 달리다 보면, 어느새 생각도 가벼워지고 발걸음도 리듬을 타게 돼.",
            tags: ["러닝", "예상 30분", "4km"]
        ),
        TodayChallenge(
            date: Date.now,
            title: "사야가 좋아하는 클라이밍",
            location: "클라이밍 짐",
            summary: "실내 클라이밍으로 전신 근력을 키우는 도전",
            tags: ["러닝", "예상 30분", "4km"]
        ),
        TodayChallenge(
            date: Date.now,
            title: "날씨도 좋은데 서핑 ㄱㄱ",
            location: "해운대 해수욕장",
            summary: "파도 위에서 균형을 잡으며 즐기는 서핑 챌린지",
            tags: ["러닝", "예상 30분", "4km"]
        ),
        TodayChallenge(
            date: Date.now,
            title: "골프 링고링고링!",
            location: "스크린 골프",
            summary: "스크린 골프로 시작하는 나만의 골프 도전기",
            tags: ["러닝", "예상 30분", "4km"]
        ),
    ]
}

