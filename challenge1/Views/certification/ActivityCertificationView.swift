//
//  ActivityCertificationView.swift
//  challenge1
//
//  Created by 노을 on 3/27/26.
//

import SwiftUI
import PhotosUI

struct ActivityCertificationView: View {
    @State var selectedImage: UIImage?
    let todayChallenge: TodayChallenge
    let onCertified: () -> Void
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            // Back button (Figma: glass capsule, x=23, y=63)
            HStack {
                Button { dismiss() } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.primary)
                        .frame(width: 44, height: 48)
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 1000))
                        .shadow(color: .black.opacity(0.12), radius: 20, y: 4)
                }
                Spacer()
            }
            .padding(.horizontal, 23)
            .padding(.top, 8)

            Spacer().frame(height: 130)

            // Photo area (Figma: 330×268, centered)
            CertificationImageView(selectedImage: $selectedImage)

            Spacer()
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            // Button (Figma: 351×58, Primary/Main)
            CertificationButton(
                isImageSelected: selectedImage != nil,
                todayChallenge: todayChallenge,
                onCertified: onCertified
            )
            .padding(.horizontal, 25)
            .padding(.vertical, 16)
        }
        .appBackground()
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        ActivityCertificationView(todayChallenge: TodayChallenge.dummies[0], onCertified: {})
    }
}
