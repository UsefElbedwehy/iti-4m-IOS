//
//  ContentView.swift
//  Lec1Demo1
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            VStack {
                maMap().ignoresSafeArea(.all)
                Spacer()
            }
            VStack {
                myImage()
                CardDetails()
                Spacer()
            }.padding(.top, 150)
        }
        
        
    }
        
}

#Preview {
    ContentView()
}
