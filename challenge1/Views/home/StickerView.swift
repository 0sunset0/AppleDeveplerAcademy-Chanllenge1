//
//  Sticker.swift
//  challenge1
//
//  Created by 노을 on 3/30/26.
//

import SwiftUI

struct StickerView: View {
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    
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
    
    var body: some View {
        Image("sandcastle")
            .offset(offset)
            .gesture(drag)
    }
}

#Preview {
    Sticker()
}
