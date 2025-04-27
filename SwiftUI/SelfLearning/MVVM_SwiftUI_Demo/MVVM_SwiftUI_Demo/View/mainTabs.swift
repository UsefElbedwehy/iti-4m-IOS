//
//  ContentView.swift
//  MVVM_SwiftUI_Demo
//
//  Created by Usef on 08/02/2025.
//

import SwiftUI

struct mainTabs: View {
    var body: some View {
        NavigationStack {
            
            TabView {
                ScrollView {
                    ZStack {
                        Color.white.ignoresSafeArea(edges: .all)
                        VStack {
                            Image("Home")
                                .resizable()
                                
                                .frame(width: UIScreen.main.bounds.width - 20, height: 200, alignment: .center)
                                .scaledToFill()
                                .padding()
                            HStack {
                                Brands(viewModel: [Brand(id: 1, name: "Home", image: "cartoon"),Brand(id: 2, name: "Home", image: "cartoon"),Brand(id: 3, name: "Home", image: "cartoon"),Brand(id: 4, name: "Home", image: "cartoon")])
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            Spacer()
                            
                        }
                    }
                }
                
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.red)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                                        HStack {
                                            Spacer()
                                            Button(action: {}) {
                                                Image(systemName: "cart.fill")
                                            }
                                            Button(action: {}) {
                                                Image(systemName: "heart.fill")
                                                    .overlay(alignment: .topTrailing, content: {
                                                        Circle()
                                                            .foregroundStyle(.red)
                                                            .frame(width: 12, height: 12)
                                                    })
                                            }
                                        }
                    }
                }
            }
            .navigationTitle(Text("Shopify"))
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.green, for: .navigationBar)
        }.accentColor(.white)
    }
}

#Preview {
    mainTabs()
}
