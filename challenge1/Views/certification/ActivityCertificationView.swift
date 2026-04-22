//
//  ActivityCertificationView.swift
//  challenge1
//
//  Created by 노을 on 3/27/26.
//

import SwiftUI
import PhotosUI

struct ActivityCertificationView: View {
    @State var selectedItem: PhotosPickerItem?
    @State var selectedImage: UIImage?
    let todayChallenge: TodayChallenge
    
    
    var isImageSelected: Bool {
        return selectedImage != nil
    }
    
    var body: some View {
        VStack{
            CertificationImageView(selectedImage: $selectedImage)
            CertificationButton(isImageSelected: isImageSelected, todayChallenge: todayChallenge)
        }
    }
}

#Preview {
    ActivityCertificationView(todayChallenge: TodayChallenge.dummies[0])
}
