//
//  LikeButton.swift
//  CoffeeCommerce
//
//  Created by Daniel Cajiao on 3/9/22.
//

import SwiftUI

struct LikeButton : View {
    @Binding var enabled: Bool
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
            Image(systemName: enabled ? "heart.fill" : "heart")
                .foregroundColor(enabled ? .pink : .black)
        }
        .onTapGesture {
            self.enabled.toggle()
            simpleSuccess()
        }
    }
}

//struct LikeButton_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeButton()
//            .previewLayout(.sizeThatFits)
//            .background(.gray)
//    }
//}
