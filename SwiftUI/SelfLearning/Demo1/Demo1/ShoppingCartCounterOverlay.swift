//
//  ShoppingCartCounterOverlay.swift
//  Demo1
//
//  Created by Usef on 06/02/2025.
//

import SwiftUI

struct ShoppingCartCounterOverlay: View {
    var body: some View {
//        Image(systemName: "cart")
//            .font(.system(size: 50))
//            .frame(width: 70, height: 70)
//            .background(
//                Color.blue.opacity(0.8)
//                .overlay (
//                    Circle()
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(.red)
//                    ,alignment: .bottomTrailing
//                ))
        let cartProductCounter: Int = 2
        Image(systemName: "cart")
            .font(.system(size: 40))
            .frame(width: 60,height: 60)
            .overlay(
                Circle()
                .fill(.red)
                .frame(width: 20, height: 20)
                .shadow(color: Color.black, radius: 30, x: 0, y: 20)
                .overlay(Text("\(cartProductCounter)").font(.caption)
                    .bold()
                    .foregroundStyle(.white))
                     ,alignment: .topTrailing
            )
            
    }
}

#Preview {
    ShoppingCartCounterOverlay()
}
