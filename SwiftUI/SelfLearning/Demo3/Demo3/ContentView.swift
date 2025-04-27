//
//  ContentView.swift
//  Demo3
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct Product :  Identifiable, Hashable {
    let id: String = UUID().uuidString
    var name  : String
    var image : String
    var count : Int
}

class ViewModel:ObservableObject {
    @Published var products : [Product] = []
    init() {
        
    }
    
    func fetchData() {
        products.append(contentsOf: [Product(name: "", image: "", count: 1),Product(name: "", image: "", count: 1),Product(name: "", image: "", count: 1),Product(name: "", image: "", count: 1)])
    }
}


struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products, id: \.self, content: { item in
                    Text(item.name)
                })
            }
            
        }
//        .environment()
    }
}

#Preview {
    ContentView()
}
