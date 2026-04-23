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
    let onCertified: () -> Void
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
            onCertified()
        } label: {
            Text("인증하기")
                .font(.dsHeadline)
                .foregroundStyle(Color.onMain)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .background(Color.main.opacity(isImageSelected ? 1.0 : 0.5))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.7), lineWidth: 1)
                )
        }
        .disabled(!isImageSelected)
    }
}

#Preview {
    CertificationButton(isImageSelected: true, todayChallenge: TodayChallenge.dummies[0], onCertified: {})
        .padding()
}
