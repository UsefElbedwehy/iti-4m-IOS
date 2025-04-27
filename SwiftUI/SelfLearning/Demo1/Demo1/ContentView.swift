//
//  ContentView.swift
//  Demo1
//
//  Created by Usef on 06/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .padding(10)
                .background(Color.blue)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(.title, design: .monospaced, weight: .regular))
            Text("Hello, Usef!")
                .font(.system(size: 24, weight: .regular, design: .monospaced))
                .padding(10)
            Text("Hello, Zeiad! iam a developer, i love swiftui and swift")
                .padding(10)
                .frame(width: 300, height: 100, alignment: .leading)
                .minimumScaleFactor(0.1)
                .multilineTextAlignment(.leading)
//                .kerning(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
