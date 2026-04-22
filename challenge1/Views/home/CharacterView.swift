//
//  CharacterView.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct CharacterView: View {
    let imageName: String
    @State private var isMoving = false

    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .offset(y: isMoving ? -10 : 0)
                .animation(
                    .easeInOut(duration: 1.0).repeatForever(autoreverses: true),
                    value: isMoving
                )
        }
        .frame(width: 260, height: 260)
        .onAppear {
            DispatchQueue.main.async {
                isMoving = true
            }
        }
    }
}

#Preview {
    ZStack {
        CharacterView(imageName: "dolphin_master")
    }
}
