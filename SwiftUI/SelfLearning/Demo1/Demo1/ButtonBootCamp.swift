//
//  ButtonBootCamp.swift
//  Demo1
//
//  Created by Usef on 07/02/2025.
//

import SwiftUI

struct ButtonBootCamp: View {
    @State var title: String = "Hello, World!"
    @State var counter: Int = 0
    var body: some View {
        Text(title)
        Button("favorite") {
            self.title = "Favorited!"
        }
        .accentColor(.red)
        Button {
            counter += 1
            self.title = "Tapped! \(counter)"
        } label: {
            Circle()
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
                .padding(10)
                .shadow(radius: 25)
                .overlay(
                    Image(systemName: "heart.fill")
                        .foregroundStyle(Color.red)
                        .font(.system(size: 32))
                )
            
        }
        

    }
}

#Preview {
    ButtonBootCamp()
}
