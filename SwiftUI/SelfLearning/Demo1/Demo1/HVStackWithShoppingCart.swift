//
//  HVStackWithShoppingCart.swift
//  Demo1
//
//  Created by Usef on 07/02/2025.
//

import SwiftUI

struct HVStackWithShoppingCart: View {
    let cartProductCounter: Int
    let favProductCounter:  Int
    var body: some View {
        
        
            VStack {
                HStack{
                    
                    
                    Text("Hello, User!")
                        .font(.system(size: 35, weight: .bold))
                        .font(.system(.title, weight: .bold))
                    Spacer()
                    Image(systemName: "cart")
                        .font(.system(size: 30))
                        .frame(width: 50
                               ,height: 50)
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
                    Image(systemName: "heart.fill")
                        .font(.system(size: 30))
                        .frame(width: 50,
                               height: 50)
                        .overlay(
                            Circle()
                                .fill(.red)
                                .frame(width: 20,
                                       height: 20)
                                .shadow(color: Color.black, radius: 30, x: 0, y: 20)
                                .overlay(Text("\(favProductCounter)").font(.caption)
                                    .bold()
                                    .foregroundStyle(.white))
                            ,alignment: .topTrailing
                        )
                }
                .padding(.horizontal)
                Spacer()
                ScrollView {
                    LazyVStack{
                        ForEach(0..<10) { index in
                            ScrollView (.horizontal ,showsIndicators:  false,
                                        content: {
                                    HStack{
                                        ForEach(0..<10){ index in
                                            VStack {
                                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                                    .fill(Color.white)
                                                    .frame(width: 200, height: 150)
                                                    .shadow(radius: 10)
                                                    .padding()
                                                    .overlay {
                                                        Image(systemName: "singaporedollarsign.bank.building.fill").font(.system(size: 50))
                                                    }
                                                Text("Product")
                                            }
                                            
                                    }
                                }
                            })
                        }
                    }
                    
                
            }
        }
    }
}
#Preview {
    HVStackWithShoppingCart(cartProductCounter: 0, favProductCounter: 0)
}
