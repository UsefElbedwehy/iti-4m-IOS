//
//  ContentView.swift
//  Lec2Task2
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(destination:
                                UserDetails(user: user)
                                , label: {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                })
            }
            .navigationTitle("Users")
        }
        .onAppear {
            getUsers()
        }
    }
    
    func getUsers() {
        Service.shared.fetchData { fetchedUser in
            self.users = fetchedUser
        }
    }
}

#Preview {
    ContentView()
}
