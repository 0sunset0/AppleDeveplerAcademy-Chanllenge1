//
//  TodayActivityView.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI


struct TodayChallengeView: View {
    @Environment(CompletedChallengeStore.self) private var store
    
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

            Text("영일대 1바퀴, 오늘의 나를 이겨봐")
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
    TodayChallengeView()
        .environment(CompletedChallengeStore())
}
