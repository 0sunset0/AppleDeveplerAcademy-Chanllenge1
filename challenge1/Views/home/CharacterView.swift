//
//  CharacterView.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct CharacterView: View {
    @State private var isMoving = false
    
    var body: some View {
        Image("dolphin")
            .resizable()
            .frame(width: 350, height: 350)
            .offset(y: isMoving ? -20 : 0)
            .animation(
                .easeInOut(duration: 0.8).repeatForever(autoreverses: true),
                value: isMoving
            )
            .onAppear {
                isMoving = true
            }
    }
}

#Preview {
    CharacterView()
}
