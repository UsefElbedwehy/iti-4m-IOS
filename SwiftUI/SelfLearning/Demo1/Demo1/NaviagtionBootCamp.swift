//
//  NaviagtionBootCamp.swift
//  Demo1
//
//  Created by Usef on 07/02/2025.
//

import SwiftUI

struct NaviagtionBootCamp: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.edgesIgnoringSafeArea(.all)
                    .navigationTitle("First Screen")
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading){
                            Image(systemName: "chevron.backward")
                        }
                        ToolbarItemGroup(placement: .topBarTrailing){
                            Image(systemName: "chevron.backward")
                            Image(systemName: "plus")
                        }
                    }
                //deprecated
//                    .navigationBarItems(leading: Image(systemName: "chevron.backward"),trailing: HStack{
//                        Image(systemName: "plus")
//                        Image(systemName: "heart.fill")
//                    })
//                    .accentColor(.white)
                VStack{
                    NavigationLink("Navigate to yellow Screen", destination: SecondScreen())
                    Text("First Screen")
                        
                }
            }
        }
    }
}

struct SecondScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .center) {
            Color.yellow.edgesIgnoringSafeArea(.all)
                .navigationTitle("Second Screen")
            //            ScrollView {
            VStack{
                Text("Second Screen")
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
//        }
        }
    }
}

#Preview {
    NaviagtionBootCamp()
}
