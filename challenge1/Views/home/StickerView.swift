//
//  Sticker.swift
//  challenge1
//
//  Created by 노을 on 3/30/26.
//

import SwiftUI

struct StickerView: View {
    
    let imageName: String
    
    @State private var offset: CGSize
    @State private var lastOffset: CGSize
    
    init(imageName: String, initialX: Int, initialY: Int) {
        self.imageName = imageName
        self.offset = .init(width: initialX, height: initialY)
        self.lastOffset = .init(width: initialX, height: initialY)
    }
    
    var body: some View {
        Image(imageName)
            .offset(offset)
            .gesture(drag)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                offset = CGSize(
                    width: lastOffset.width + value.translation.width,
                    height: lastOffset.height + value.translation.height
                )
            }.onEnded { _ in
                lastOffset = offset
            }
    }
}

#Preview {
    StickerView(imageName: "sandcastle", initialX: 0, initialY: 0)
}
