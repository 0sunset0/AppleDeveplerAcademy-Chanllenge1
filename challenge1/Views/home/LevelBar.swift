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
    let progress: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(levelName)
                .font(.headline)
            ProgressView(value: progress)
                .tint(.main)
          }
          .padding()
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 16))
          .shadow(radius: 4)
    }
}

#Preview {
    LevelBar(levelName: "아기 돌고래", description: "아직 세상에 나오지 않은 신비로운 존재" ,progress: 0.6)
}
