//
//  NavStackBootCamp.swift
//  Demo1
//
//  Created by Usef on 08/02/2025.
//

import SwiftUI

struct NavStackBootCamp: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack (spacing: 20){
                        ForEach(["SwiftUI", "Combine", "UIKit"], id: \.self) { item in
                            NavigationLink(value: item) {
                                Text("Go to say hello to \(item)")
                            }
                        }
                        ForEach(0..<10) { index in
                            NavigationLink(value: index) {
                                Text("Go to Screen \(index)")
                            }
                        }
                    }.padding(20)
                }.navigationTitle(Text("Navigation Stack"))
                    .navigationDestination(for: Int.self) { value in
                        Text("This Screen with id: \(value)")
                    }
                    .navigationDestination(for: String.self) { str in
                        Text("Hello! \(str)")
                        NavigationLink(value: 10) {
                            Text("my rating is: \(10)")
                        }
                    }
            }
        }
    }
}

#Preview {
    NavStackBootCamp()
}
