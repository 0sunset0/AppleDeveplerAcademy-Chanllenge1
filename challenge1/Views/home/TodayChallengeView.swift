//
//  TodayActivityView.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI
import SwiftData

struct TodayChallengeView: View {
    let todayChallenge: TodayChallenge

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("activity")
                .resizable()
                .scaledToFill()
                .frame(width: 290, height: 132)
                .clipped()
                .clipShape(UnevenRoundedRectangle(
                    topLeadingRadius: 20,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 20
                ))

            Text(todayChallenge.title)
                .font(.dsHeadline)
                .foregroundStyle(Color.textBody)
                .lineLimit(2)
                .padding(.horizontal, 16)
                .padding(.top, 20)
                .padding(.bottom, 40)
        }
        .frame(width: 290)
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
    TodayChallengeView(todayChallenge: TodayChallenge.dummies[0])
        .padding()
}
