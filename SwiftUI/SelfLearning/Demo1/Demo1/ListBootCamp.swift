//
//  ListBootCamp.swift
//  Demo1
//
//  Created by Usef on 08/02/2025.
//

import SwiftUI

struct ListBootCamp: View {
    @State var fruits = ["Cherry","Orange","Banana","Apple","Watermelon"]
    @State var viggies = ["Carrot","Tomato","Potato","Onion","Cucumber"]
    var body: some View {
        NavigationView {
            
            List{
                Section(header: Text("BootCamp")){
                    ForEach(fruits, id: \.self){ fruit in
                        Label(fruit, systemImage: "paperplane.fill")
                            .foregroundStyle(Color.red)
                    }
                    .onDelete(perform: deleteFromFruits)
                    .onMove(perform: moveFruits)
                }
                Section(header: Text("nav")){
                    NavigationLink("toti") {
                        Label("toti", systemImage: "paperplane.fill")
                            .foregroundStyle(Color.red)
                    }
                }
                
            }
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
            }
            
        }
    }
    
    
    
    func deleteFromFruits(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    func moveFruits(fromOffsets: IndexSet, toOffset: Int) {
        fruits.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}




#Preview {
    ListBootCamp()
}
