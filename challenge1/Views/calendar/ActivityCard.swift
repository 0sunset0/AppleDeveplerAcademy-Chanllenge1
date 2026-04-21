//
//  ActivityCard.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct ActivityCard: View {
    
    let completedActivity: CompletedActivity
    
    var body: some View {
        HStack {
            Text(completedActivity.todayChallenge.title)
                .font(.body)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.06), radius: 6, y: 2)
    }
}

#Preview {
    ActivityCard(completedActivity: CompletedActivity(id: UUID(), completedDate: Date(), imageName: "activity", todayChallenge: TodayChallenge(id: UUID(), date: Date(), title: "Challenge 1")))
}
