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
        VStack {
            Text(completedActivity.completedDate, style: .date)
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
            
            Text(completedActivity.challenge.title)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
            
            Image(completedActivity.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit) // 이미지 비율 유지하면서 프레임 안에 맞춤 (잘리지 않음)
                .cornerRadius(22)
                .padding(30)
            
        }
    }
}

#Preview {
    ActivityDetailCard(completedActivity: CompletedActivity(id: UUID(), completedDate: Date(), imageName: "activity", challenge: Challenge(id: UUID(), date: Date(), title: "Challenge 1")))
}
