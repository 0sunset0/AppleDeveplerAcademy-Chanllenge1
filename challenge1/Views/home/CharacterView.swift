//
//  CharacterView.swift
//  challenge1
//
//  Created by 노을 on 3/28/26.
//

import SwiftUI

struct CharacterView: View {
    @State private var isMoving = false
    @AppStorage("profileAnimal") private var profileAnimal: String?
    
    var body: some View {
        //TODO: 기본 프로필 이미지는 뭘로 하지?
        let animal = Animal.all.first(where: {$0.id.uuidString == profileAnimal})
        Image(animal?.image ?? "dolphin")
            .resizable()
            .frame(width: 350, height: 350)
            .offset(y: isMoving ? -10 : 0)
            .animation(
                .easeInOut(
                    duration: 1.0).repeatForever(autoreverses: true),
                    value: isMoving
            )
            .onAppear {
                // 트랜잭션이 닫힌 다음에 isMoving=true를 실행하도록 실행 순서를 보장, 렌더링 완료 후 실행
                //이 클로저를 Main Queue 맨 뒤에 넣어줘. 나는 기다리지 않고 바로 다음 줄 실행할게
                DispatchQueue.main.async {
                  isMoving = true
              }
            }
    }
}

#Preview {
    CharacterView()
}
