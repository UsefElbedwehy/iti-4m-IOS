//
//  ObservablesBootCamp.swift
//  Demo1
//
//  Created by Usef on 08/02/2025.
//

import SwiftUI

struct FruitModel: Identifiable ,Hashable {
    let id: String = UUID().uuidString
    var name: String
    var count: Int
    var color: Color
}
class FruitViewModel : ObservableObject {
    @Published var fruitsArray:[FruitModel] = []
    @Published var isLoading:Bool = false
    init () {
        getFruits()
    }
    func moveFruit(indexSet: IndexSet, offSet: Int) {
        fruitsArray.move(fromOffsets: indexSet, toOffset: offSet)
    }
    func deleteFruit(indexSet: IndexSet) {
        fruitsArray.remove(atOffsets: indexSet)
    }
    func getFruits() {
        isLoading = true
        let fruits1 = FruitModel(name: "Orange", count: 2, color: Color.orange)
        let fruits2 = FruitModel(name: "Bananas", count: 9, color: Color.yellow)
        let fruits3 = FruitModel(name: "Cerry", count: 4, color: Color.red)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.isLoading = false
            self.fruitsArray.append(fruits1)
            self.fruitsArray.append(fruits2)
            self.fruitsArray.append(fruits3)
        })
    }
}

struct ObservablesBootCamp: View {
//    @State var fruitsArray:[FruitModel] = []
    @StateObject var fruitsViewModel:FruitViewModel = FruitViewModel()
    var body: some View {
        NavigationView {
            List {
                if fruitsViewModel.isLoading {
                    ProgressView()
                }else{
                    ForEach(fruitsViewModel.fruitsArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundStyle(fruit.color)
                            Text(fruit.name)
                                .bold()
                            
                        }
                    }.onDelete(perform: fruitsViewModel.deleteFruit)
                        .onMove(perform: fruitsViewModel.moveFruit)
                }
            }
            .navigationTitle(Text("Fruit List"))
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(destination: RandomView(fruitsViewModel: fruitsViewModel), label: {
                        Image(systemName: "arrow.right")
                    })
                }
            }
        }.accentColor(Color.red)
    }

}

struct RandomView: View {
    @ObservedObject var fruitsViewModel:FruitViewModel
    var body: some View {
        ZStack {
            Color.cyan.ignoresSafeArea(edges: .all)
            HStack () {
                AddBackButtonView()
                ForEach(fruitsViewModel.fruitsArray, id: \.self) { fruit in
                    Text(fruit.name)
                }
            }
        }
    }
}

struct AddBackButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Go Back")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .padding()
                .background(Color.blue)
        })
    }
}

#Preview {
    ObservablesBootCamp()
}


