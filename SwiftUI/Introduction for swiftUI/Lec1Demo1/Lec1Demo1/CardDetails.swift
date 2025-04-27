//
//  CardDetails.swift
//  Lec1Demo1
//
//  Created by Usef on 09/02/2025.
//

import SwiftUI

struct CardDetails: View {
    @State var searchText:String = ""
    @State var DisplayText:String = "Displays Here"
    var body: some View {
        Text(DisplayText)
        HStack{
            Text("Current Location")
            Spacer()
            Text("New Damietta")
        }
        .padding()
        TextField("Search...", text: $searchText)
            .padding()
        HStack{
            Button(action: {
                DisplayText = searchText
            }, label: {
                Text("Submit")
                    .foregroundStyle(.white)
            }).disabled(searchText.isEmpty)
                .frame(width: 140, height: 30)
                .background(searchText.isEmpty ? Color.gray : Color.blue)
                .cornerRadius(20)
                
        }
            
    }
}

#Preview {
    CardDetails()
}
