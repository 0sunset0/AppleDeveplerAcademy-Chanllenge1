//
//  CertificationImageView.swift
//  challenge1
//
//  Created by 노을 on 3/31/26.
//

import SwiftUI
import PhotosUI

struct CertificationImageView: View {
    @State private var selectedItem: PhotosPickerItem?
    @Binding var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .cornerRadius(12)
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
                
            } else {
                Image(systemName: "camera.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
                
            }
            /**
             $는 @State 변수의 Binding 버전을 꺼내는 기호
             PhotosPicker는 사용자가 사진을 선택했을 때 직접 selectedItem에 값을 써야함. -> 그래서 selection의 타입으로 Binding<PhotosPickerItem?>를 받는다.
             */
            PhotosPicker(
                selection: $selectedItem,
                matching: .images
            ) {
                Text("라이브러리에서 선택하기")
                    .frame(maxWidth: .infinity, maxHeight: 50)
            }
            .photosPickerStyle(.inline)
            .onChange(of: selectedItem) { _, newItem in
                Task {
                    /**
                     loadTransferable은 비동기 함수로 await이 필수 : 없으면 컴파일 에러
                     try? : 에러가 발생하면 nil 반환, try: 에러가 발생 시 호출자로 전달, try!: 에러가 발생 시 앱 크래시
                     */
                    
                    /**
                     UIImage(data: data) 는 init? failable initializer : 입력값이 항상 유효하다고 보장할 수 없는 초기화에 사용한다. 강제로 인스턴스를 만들었다가 크래시가 나는 것보다, nil을 반환해서 호출자가 처리하게 하는 방식이 더 안전하다.
                     */
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                            selectedImage = image
                        }
                    }
            }
        }
    }
}

#Preview {
      CertificationImageView(selectedImage: .constant(nil))
  }
