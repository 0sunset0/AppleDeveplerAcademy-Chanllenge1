//
//  CertificationButton.swift
//  challenge1
//
//  Created by 노을 on 3/31/26.
//

import SwiftUI

struct CertificationButton: View {
    let isImageSelected: Bool
    let challenge: Challenge
    @Environment(CompletedChallengeStore.self) private var store
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button {
            store.complete(challenge: challenge, imageName: "")
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
    CertificationButton(isImageSelected: true, challenge: Challenge.dummies[0])
        .environment(CompletedChallengeStore())
}
