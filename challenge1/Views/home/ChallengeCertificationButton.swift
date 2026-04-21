//
//  ChallengeCertification.swift
//  challenge1
//
//  Created by 노을 on 3/30/26.
//

import SwiftUI
import PhotosUI

struct ChallengeCertificationButton: View {
    let todayChallenge: TodayChallenge
    @State private var navigate = false
    
    var body: some View {
        Button("인증하기") {
            navigate = true
        }
        .buttonStyle(.bordered)
        .tint(.main)
        .fullScreenCover(isPresented: $navigate) {
            ActivityCertificationView(todayChallenge: todayChallenge)
        }
    }
}

#Preview {
    ChallengeCertificationButton(todayChallenge: TodayChallenge.dummies[1])
}
