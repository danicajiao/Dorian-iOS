//
//  HeartButton.swift
//  CoffeeCommerce
//
//  Created by Daniel Cajiao on 3/7/22.
//

import SwiftUI

struct HeartButton: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .frame(width: 35, height: 35)
                .foregroundColor(configuration.isPressed ? .gray : .white)
            Image(systemName: "heart")
        }
    }
}

struct HeartButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("") {}
            .buttonStyle(HeartButton())
            .previewLayout(.sizeThatFits)
            .background(.gray)
    }
}
