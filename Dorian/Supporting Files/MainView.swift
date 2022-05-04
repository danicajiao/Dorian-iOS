//
//  MainView.swift
//  Dorian
//
//  Created by Daniel Cajiao on 3/10/22.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = "home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView()
                .onTapGesture {
                    selectedTab = "home"
                }
                .tabItem {
                    Label("Home", systemImage: selectedTab == "home" ? "house.fill" : "house")
                        .environment(\.symbolVariants, .none)
                }
                .tag("home")
            
            Text("Browse Scene")
                .onTapGesture {
                    selectedTab = "browse"
                }
                .tabItem {
                    Label("Browse", systemImage: selectedTab == "browse" ? "magnifyingglass" : "magnifyingglass")
                        .environment(\.symbolVariants, .none)
                }
                .tag("browse")
            
            Text("Bag Scene")
                .onTapGesture {
                    selectedTab = "bag"
                }
                .tabItem {
                    Label("Bag", systemImage: selectedTab == "bag" ? "bag.fill" : "bag")
                        .environment(\.symbolVariants, .none)
                }
                .tag("bag")
            
            Text("Favorites Scene")
                .onTapGesture {
                    selectedTab = "favorites"
                }
                .tabItem {
                    Label("Favorites", systemImage: selectedTab == "favorites" ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, .none)
                }
                .tag("favorites")
            
            Text("Profile Scene")
                .onTapGesture {
                    selectedTab = "profile"
                }
                .tabItem {
                    Label("Profile", systemImage: selectedTab == "profile" ? "person.crop.circle.fill" : "person.crop.circle")
                        .environment(\.symbolVariants, .none)
                }
                .tag("profile")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
