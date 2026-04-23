//
//  LevelBar.swift
//  challenge1
//
//  Created by 노을 on 4/20/26.
//

import SwiftUI

struct LevelBar: View {
    let levelName: String
    let description: String
    let progress: Double  // 0.0 ~ 1.0

    @State private var animatedProgress: Double = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                Text(levelName)
                    .font(.dsTitle2)
                    .foregroundStyle(Color.textBody)
                Spacer()
                Text("자세히 보기")
                    .font(.dsCaption)
                    .foregroundStyle(Color.textSecondary)
                    .padding(.top, 6)
            }

            Text(description)
                .font(.dsBody)
                .foregroundStyle(Color.textSecondary)
                .padding(.top, 8)

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    // Track
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(hex: "E0ECF8"))

                    // Fill + Highlight
                    let fillWidth = geo.size.width * max(0.04, min(1, animatedProgress))
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(LinearGradient(
                                colors: [Color.main, Color(hex: "149FCD")],
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .shadow(color: Color.main.opacity(0.3), radius: 3, y: 1)

                        RoundedRectangle(cornerRadius: 6)
                            .fill(LinearGradient(
                                colors: [.white, .white.opacity(0)],
                                startPoint: .top,
                                endPoint: .bottom
                            ))
                            .opacity(0.35)
                    }
                    .frame(width: fillWidth)
                }
            }
            .frame(height: 12)
            .padding(.top, 16)
        }
        .padding(.top, 20)
        .padding(.bottom, 24)
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 1)
        )
        .cardShadow()
        .onAppear {
            withAnimation(.spring(duration: 0.8, bounce: 0.3).delay(0.5)) {
                animatedProgress = progress
            }
        }
        .onChange(of: progress) { _, newValue in
            withAnimation(.spring(duration: 0.8, bounce: 0.3)) {
                animatedProgress = newValue
            }
        }
    }
}

#Preview {
    LevelBar(levelName: "아기 돌고래", description: "액티비티에 재미 붙이는 중~", progress: 0.6)
        .padding()
        .appBackground()
}
