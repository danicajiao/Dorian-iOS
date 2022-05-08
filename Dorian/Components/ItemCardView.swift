//
//  ItemCardView.swift
//  Dorian
//
//  Created by Daniel Cajiao on 3/6/22.
//

import SwiftUI
import FirebaseStorage

struct ItemCardView: View {
    @StateObject var item: Item
    @EnvironmentObject var tabState: TabState
    @State var retrievedImage: UIImage = UIImage()
    @State private var pressed = false
    @State private var opacity = 1.0
    @State private var isDragging = false
    @State private var rectHeight = CGFloat.random(in: 150...180)
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(uiImage: retrievedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(opacity)
                
                VStack {
                    Text(item.name)
                        .font(Font.custom("Poppins-Regular", size: 14))
                        .foregroundColor(.secondaryColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("$" + String(item.price))
                        .font(Font.custom("Poppins-Regular", size: 16))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 5))
                .opacity(opacity)
            }
            .background(alignment: .bottom) {
                Rectangle()
                    .frame(height: rectHeight)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .shadow(color: .dropShadowColor, radius: 20)
                    .opacity(opacity)
            }
            .onAppear {
                // Get a reference to storage
                let storageRef = Storage.storage().reference()

                // Specify the path
                let fileRef = storageRef.child(item.imgPath)

                // Retrieve the data
                fileRef.getData(maxSize: 1 * 1024 * 1024 as Int64) { data, error in
                    // Check for errors
                    if error == nil && data != nil {
                        // Create a UIImage
                        if let image = UIImage(data: data!) {
                            DispatchQueue.main.async {
                                self.retrievedImage = image
                            }
                        }
                    }
                }
            }
            .onTapGesture {
                tabState.currentTab = "browse"
            }
//            .onTapGesture { }
//            .onLongPressGesture(minimumDuration: 2.5, maximumDistance: 2, pressing: { pressing in
//                self.pressed = pressing
//                if pressing {
//                    self.opacity = 0.5
//                } else {
//                    withAnimation(.easeOut(duration: 0.4)) {
//                        self.opacity = 1.0
//                    }
//                    tabState.previousTab = tabState.currentTab
//                    tabState.currentTab = "browse"
//                    print("Switched tab to: \(tabState.currentTab)")
//                }
//            }, perform: { })
            
            LikeButton(enabled: $item.favorited)
                .shadow(color: .dropShadowColor, radius: 20)
            
        }
    }
}

struct ItemCardView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCardView(item: Item(id: "12345aaaa", brand: "Wonderstate Coffee", name: "Star Valley Decaf", price: 23, imgPath: "item-images/WST-1011_2.jpeg"))
            .previewLayout(.sizeThatFits)
    }
}
