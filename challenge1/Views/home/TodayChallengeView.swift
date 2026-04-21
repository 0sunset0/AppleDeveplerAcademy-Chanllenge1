//
//  TodayActivityView.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI


struct TodayChallengeView: View {
    let challenge: Challenge

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("activity")
                .resizable()
                .scaledToFill()
                .frame(height: 160)
                .clipped()
                .clipShape(UnevenRoundedRectangle(
                    topLeadingRadius: 16,
                    topTrailingRadius: 16
                ))

            Text(challenge.title)
                .font(.subheadline)
                .padding()
        }
        .background(Color(.systemBlue).opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4)
        .frame(width: 260)
    }
}

#Preview {
    TodayChallengeView(challenge: Challenge.dummies[0])
}
