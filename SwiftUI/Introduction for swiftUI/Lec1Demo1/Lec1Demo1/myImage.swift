//
//  myImage.swift
//  Lec1Demo1
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct myImage: View {
    var body: some View {
        Image("Usef")
            .resizable()
            .scaledToFill()
            .foregroundStyle(Color.green)
            .background(Color.white.opacity(1))
            .frame(width: 180, height: 180)
            .clipShape(Circle())
            .shadow(radius: 20)
            .overlay {
                Circle().stroke(Color.black, lineWidth: 2)
            }    }
}

#Preview {
    myImage()
}
