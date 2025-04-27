//
//  ContentView.swift
//  Demo5
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State var isSelected: Bool = false
    var body: some View {
        
        NavigationView {
            LazyVStack {
                LazyHStack {
                    Button(action: {
                        //filter
                        self.isSelected.toggle()
                    }, label: {
                        Text("Filter")
                            .font(.title)
                            .bold()
                            .foregroundStyle(isSelected ? Color.blue:Color.white)
                            .frame(width: 90, height: 40)
                            .background(isSelected ? Color.white:Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
