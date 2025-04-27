//
//  ShapesBootcamp.swift
//  Demo1
//
//  Created by Usef on 06/02/2025.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        Circle()
//            .fill(.blue)
//            .stroke(Color.red, lineWidth: 10)
//            .strokeBorder(.indigo, lineWidth: 20, antialiased: true)
            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, dash: [30]))
        
    }
}

#Preview {
    ShapesBootcamp()
}
