//
//  AlertBootCamp.swift
//  Demo1
//
//  Created by Usef on 08/02/2025.
//

import SwiftUI

struct AlertBootCamp: View {
    @State var isAlert:Bool = false
    @State var backgroundColor:Color = .white
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor.ignoresSafeArea(edges: .all)
                
                HStack {
                    Button("Click Me") {
                        isAlert.toggle()
                    }.alert(isPresented: $isAlert, content: {
                        getAlert()
                    })
                }
            }
        }
    }
    func getAlert() -> Alert {
        Alert(title: Text("Hello"),
              message: Text("why u click me"),
              primaryButton: .default(Text("OK"),action: {
            backgroundColor = .brown
        }), secondaryButton: .cancel())
    }
}



#Preview {
    AlertBootCamp()
}
