//
//  UserDetails.swift
//  Lec2Task2
//
//  Created by Usef on 10/02/2025.
//

import SwiftUI

struct UserDetails: View {
    var user: User
    let url = URL(string: "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50.jpg")
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(
                    url: url,
                    content: { image in
                        image
                            .resizable()
                             // Apply before frame
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                    },
                    placeholder: {
                        ProgressView()
                    }
                )

            
                    
                Text("User Email: \(user.email)")
                    .font(.headline)
                    .padding()
                Text("User Details: \(user.about)")
                    .font(.headline)
                    .padding()
                Spacer()
                
            }
        }
    }
}

#Preview {
    UserDetails(user: User(id: "123", name: "ahmed", about: "the land is here", email: "ahmed@gmail.com"))
}
