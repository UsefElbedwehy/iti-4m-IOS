//
//  SheetBootCamp.swift
//  Demo1
//
//  Created by Usef on 07/02/2025.
//

import SwiftUI

struct SheetBootCamp: View {
    @State var showSheet:Bool = false
    var body: some View {
        ZStack {
            //background
            Color.yellow
                .ignoresSafeArea(edges: .all)
            
            //foreground
            Button(action: {
                //add sheet action here
                showSheet.toggle()
            },label: {
                Text("Show Sheet")
                    .font(.system(size: 19))
                    .bold()
                    .frame(width: 150, height: 35)
                    .padding(10)
                    .background(Color.black)
                    .cornerRadius(20)
                    .foregroundStyle(.white)
            }).sheet(isPresented: $showSheet , content: {
                loginSheet()
            })
        }
    }
}

struct loginSheet: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack (alignment: .topLeading){
            //background
            Color.pink
                .ignoresSafeArea(edges: .all)
            
            //foreground
            Button(action: {
                //add sheet action here
                presentationMode.wrappedValue.dismiss()
            },label: {
                Image(systemName: "xmark")
                    .font(.largeTitle)
                    .frame(width: 35, height: 35)
                    .padding()
//                    .background(Color.clear)
                    .foregroundStyle(.white)
            })
        }
    }
}

#Preview {
    SheetBootCamp()
}
