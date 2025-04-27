//
//  StacksBootCamp.swift
//  Demo1
//
//  Created by Usef on 07/02/2025.
//

import SwiftUI

struct StacksBootCamp: View {
    var body: some View {
        VStack(){
            Rectangle().fill(Color.red).frame(width: 100, height: 100)
            Rectangle().fill(Color.blue)
                .frame(width: 100, height: 100)
            Rectangle().fill(Color.green)
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    StacksBootCamp()
}
