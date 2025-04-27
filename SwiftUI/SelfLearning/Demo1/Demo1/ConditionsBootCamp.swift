//
//  ConditionsBootCamp.swift
//  Demo1
//
//  Created by Usef on 07/02/2025.
//

import SwiftUI

struct ConditionsBootCamp: View {
    @State var isLoading:Bool = false
    @State var btn1Color:Color = Color.green
    var body: some View {
        Button(action: {
            btn1Color = .blue
        }) {
            Text("Click Me")
        }
        .foregroundStyle(.white)
            .padding(10)
            .frame(width: 200, height: 50)
            .background(btn1Color)
            .cornerRadius(20)
        
        Button(action: {
            self.isLoading.toggle()
        }) {
            Text("Loading")
        }.alert(isPresented: $isLoading) {
            Alert(title: Text("Loading..."),message: Text("Please wait!"), dismissButton: .default(Text("OK")))
        }
        .foregroundStyle(.white)
        .padding(10)
        .frame(width: 200, height: 50)
        .background(Color.red)
        .cornerRadius(20)
        if isLoading {
            ProgressView()
        }
    }
}

#Preview {
    ConditionsBootCamp()
}
