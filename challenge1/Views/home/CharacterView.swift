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
            // Glow ellipse behind the marble (Figma: Ellipse3 240×240, offset y=9)
            Ellipse()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 0.74, green: 0.83, blue: 0.94).opacity(0.55),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: 110
                    )
                )
                .frame(width: 265, height: 265)
                .blur(radius: 18)
                .offset(y: 9)

            // Glass marble container (Figma: 315×299, white 10%, cornerRadius 150)
            ZStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 242, height: 242)
                    .offset(y: isMoving ? -10 : 0)
                    .animation(
                        .easeInOut(duration: 1.0).repeatForever(autoreverses: true),
                        value: isMoving
                    )
            }
            .frame(width: 315, height: 299)
            .background(Color.white.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 150))


        }
        .frame(width: 315, height: 299)
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
