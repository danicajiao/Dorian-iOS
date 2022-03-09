//
//  HeartButton.swift
//  CoffeeCommerce
//
//  Created by Daniel Cajiao on 3/7/22.
//

import SwiftUI

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


struct HeartButton: ButtonStyle {
    
    @Binding var enabled: Bool
            
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .frame(width: 35, height: 35)
                .foregroundColor(configuration.isPressed ? .gray : .white)
//            Image(systemName: buttonState ? "heart.fill" : "heart")
//                .foregroundColor(buttonState ? .red : .black)
            Image(systemName: enabled ? "heart.fill" : "heart")
                .foregroundColor(enabled ? .pink : .black)
        }
    }
}

struct HeartButton_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(true) {
            Button("") {
                
            }
            .buttonStyle(HeartButton(enabled: $0))
            .previewLayout(.sizeThatFits)
            .background(.gray)
        }
    }
}
