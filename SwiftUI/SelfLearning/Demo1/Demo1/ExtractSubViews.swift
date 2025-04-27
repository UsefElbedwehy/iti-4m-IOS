//
//  ExtractSubViews.swift
//  Demo1
//
//  Created by Usef on 07/02/2025.
//

import SwiftUI

struct ExtractSubViews: View {
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea(edges: .all)
            
HStack {
    MyItem(number: 10, fruits: "Apples", color: Color.red)
    MyItem(number: 26, fruits: "Oranges", color: Color.orange)
    MyItem(number: 33, fruits: "Bananas", color: Color.yellow)
            }
            
        }
    }
}

#Preview {
    ExtractSubViews()
}

struct MyItem: View {
    var number:Int
    var fruits:String
    var color:Color
    var body: some View {
        VStack {
            Text("\(number)")
            Text(fruits)
        }
        .padding(10)
        .foregroundColor(.white)
        .padding()
        .background(color)
        .cornerRadius(20)
    }
}
