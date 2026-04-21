//
//  CertificationButton.swift
//  challenge1
//
//  Created by 노을 on 3/31/26.
//

import SwiftUI
import SwiftData

struct CertificationButton: View {
    let isImageSelected: Bool
    let todayChallenge: TodayChallenge
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Button {
            todayChallenge.complete()
            let activity = CompletedActivity(
                completedDate: .now,
                imageName: "activity",
                todayChallenge: todayChallenge
            )
            context.insert(activity)
            
            dismiss()
        } label: {
            Text("인증")
                .frame(maxWidth: .infinity, maxHeight: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .buttonStyle(.bordered)
        .tint(.main)
        .disabled(isImageSelected == false)
    }
}

#Preview {
    CertificationButton(isImageSelected: true, todayChallenge: TodayChallenge.dummies[0])
}
