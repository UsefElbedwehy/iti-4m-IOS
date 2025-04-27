//
//  Brands.swift
//  MVVM_SwiftUI_Demo
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct Brands: View {
    var viewModel: [Brand]
    var body: some View {
        ZStack {
            ScrollView {
                ScrollView (.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(viewModel, id: \.self) { item in
                            Image(item.image).resizable()
                                .resizable()
                                .frame(width: 200, height: 100, alignment: .center)
                        }
                    }
                }
                ScrollView (.horizontal, showsIndicators: false){
                    HStack {
                        Image("Home").resizable()
                            .resizable()
                            .frame(width: 200, height: 100, alignment: .center)
                        Image("Home").resizable()
                            .resizable()
                            .frame(width: 200, height: 100, alignment: .center)
                        Image("Home").resizable()
                            .resizable()
                            .frame(width: 200, height: 100, alignment: .center)
                    }
                }
                
            }
        }
    }
}

#Preview {
    Brands(viewModel: [Brand(id: 1, name: "Home", image: "Home"),Brand(id: 2, name: "Home", image: "Home"),Brand(id: 3, name: "Home", image: "Home"),Brand(id: 4, name: "Home", image: "Home")])
}
