//
//  GlowCircle이.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct GlowCircle: View {
    var body: some View {
        Circle()
            .fill(.main.opacity(0.1))
            .frame(width: 200, height: 200)
            .blur(radius: 50)
    }
}

#Preview {
    GlowCircle()
}
