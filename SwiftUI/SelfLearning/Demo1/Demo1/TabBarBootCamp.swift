//
//  TabBarBootCamp.swift
//  Demo1
//
//  Created by Usef on 08/02/2025.
//

import SwiftUI

struct TabBarBootCamp: View {
    let homeTabViewTitle: String = "Home"
    let favouritesTabViewTitle: String = "Favourites"
    let profileSettingTabViewTitle: String = "Profile"
    init() {
        UITabBar.appearance().barTintColor = UIColor.red
    }
    @State var tabBarSelection = 1
    var body: some View {
        TabView(selection: $tabBarSelection) {
            Tab(homeTabViewTitle, systemImage: "house.fill",value: 0) {
                HomeTabView()
            }
            Tab(favouritesTabViewTitle, systemImage: "heart.fill",value: 1) {
                FavouritesTabView()
            }
            Tab(profileSettingTabViewTitle, systemImage: "person",value: 2) {
                ProfileSettingTabView()
            }.badge("!")
        }
        
    }
}

#Preview {
    TabBarBootCamp()
}

struct HomeTabView: View {
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea(edges: .all)
            Text("Home page")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

struct FavouritesTabView: View {
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea(edges: .all)
            Text("Favourites page")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

struct ProfileSettingTabView: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea(edges: .all)
            Text("Profile page")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}
