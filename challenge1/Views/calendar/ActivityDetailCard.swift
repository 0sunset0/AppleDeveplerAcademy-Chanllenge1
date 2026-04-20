//
//  ActivityCard.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct ActivityDetailCard: View {
    
    let completedActivity: CompletedActivity
    
    var body: some View {
        HStack {
            Text(completedActivity.challenge.title)
                .font(.body)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.06), radius: 6, y: 2)
    }
}

#Preview {
    ActivityDetailCard(completedActivity: CompletedActivity(id: UUID(), completedDate: Date(), imageName: "activity", challenge: Challenge(id: UUID(), date: Date(), title: "Challenge 1")))
}
