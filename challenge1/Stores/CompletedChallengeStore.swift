//
//  ChallengeStore.swift
//  challenge1
//
//  Created by 노을 on 4/1/26.
//

import Foundation
/**
 @Observable: 이 값을 쓰는 뷰가 자동으로 다시 그려짐
 */
@Observable
class CompletedChallengeStore {
    var challenges: [Challenge] = Challenge.dummies
    var completedActivities: [CompletedActivity] = CompletedActivity.dummies

    func complete(challenge: Challenge, imageName: String) {
        let activity = CompletedActivity(
            id: UUID(),
            completedDate: .now,
            imageName: imageName,
            challenge: challenge
        )
        completedActivities.append(activity)
    }
}
