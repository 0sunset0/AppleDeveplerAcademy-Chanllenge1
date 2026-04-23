//
//  CertificationImageView.swift
//  challenge1
//
//  Created by 노을 on 3/31/26.
//

import SwiftUI
import PhotosUI

struct CertificationImageView: View {
    @State private var selectedItem: PhotosPickerItem?
    @Binding var selectedImage: UIImage?

    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images) {
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 330, height: 268)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(hex: "EFEFEF"))
                    VStack(spacing: 12) {
                        Image(systemName: "photo.badge.plus")
                            .font(.system(size: 36))
                            .foregroundStyle(Color.textSecondary)
                        Text("탭하여 사진 추가")
                            .font(.dsBody)
                            .foregroundStyle(Color.textSecondary)
                            .tracking(-0.41)
                    }
                }
                .frame(width: 330, height: 268)
            }
        }
        .buttonStyle(.plain)
        .onChange(of: selectedItem) { _, newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    selectedImage = image
                }
            }
        }
    }
}

#Preview {
    CertificationImageView(selectedImage: .constant(nil))
}
