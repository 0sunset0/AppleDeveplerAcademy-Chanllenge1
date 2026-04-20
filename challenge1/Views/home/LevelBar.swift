//
//  LevelBar.swift
//  challenge1
//
//  Created by 노을 on 4/20/26.
//

import SwiftUI

struct LevelBar: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("아기 돌고래")
                .font(.headline)
            Text("액티비티에 재미 붙이는 중~")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            ProgressView(value: 0.6)
                .tint(.blue)
          }
          .padding()
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 16))
          .shadow(radius: 4)
    }
}

#Preview {
    LevelBar()
}
