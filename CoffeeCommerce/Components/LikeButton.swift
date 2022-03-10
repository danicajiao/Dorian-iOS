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

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    var body: some View {
        content($value)
    }

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: value)
        self.content = content
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(false) { LikeButton(enabled: $0) }
        .previewLayout(.sizeThatFits)
    }
}
