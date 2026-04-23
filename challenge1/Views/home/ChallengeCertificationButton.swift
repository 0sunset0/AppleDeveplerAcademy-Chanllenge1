//
//  ChallengeCertification.swift
//  challenge1
//
//  Created by 노을 on 3/30/26.
//

import SwiftUI

struct ChallengeCertificationButton: View {
    let todayChallenge: TodayChallenge
    let onCertified: () -> Void

    var body: some View {
        NavigationLink(
            destination: ActivityCertificationView(
                todayChallenge: todayChallenge,
                onCertified: onCertified
            )
        ) {
            Text("인증하기")
                .font(.dsHeadline)
                .foregroundStyle(Color.onMain)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .background(Color.main)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.7), lineWidth: 1)
                )
        }
    }
}

#Preview {
    NavigationStack {
        ChallengeCertificationButton(
            todayChallenge: TodayChallenge.dummies[1],
            onCertified: {}
        )
        .padding()
    }
}
