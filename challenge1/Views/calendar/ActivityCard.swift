//
//  ActivityCard.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI
import SwiftData

struct ActivityCard: View {
    let completedActivity: CompletedActivity

    var body: some View {
        HStack {
            Text(completedActivity.todayChallenge.title)
                .font(.dsBody)
                .foregroundStyle(Color.textBody)
                .tracking(-0.41)
                .lineLimit(1)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(Color.textBody)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color.card)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 1)
        )
        .cardShadow()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(
        for: TodayChallenge.self, CompletedActivity.self,
        configurations: config
    )
    let challenge = TodayChallenge.dummies[0]
    container.mainContext.insert(challenge)
    let activity = CompletedActivity(
        completedDate: Date(),
        imageName: "activity",
        todayChallenge: challenge
    )
    container.mainContext.insert(activity)
    return ActivityCard(completedActivity: activity)
        .padding()
        .modelContainer(container)
}
