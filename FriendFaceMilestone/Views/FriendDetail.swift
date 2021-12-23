//
//  FriendDetail.swift
//  FriendFaceMilestone
//
//  Created by Amit Shrivastava on 22/12/21.
//

import SwiftUI

struct FriendDetail: View {
    let user: User
    let results: [User]
   
    var body: some View {
        Form {
            List {
                Section("Name") {
                Text(user.name)
                        .font(.body)
                }
                Section("email") {
                Text(user.email)
                    .font(.body)
                }
                Section("registration date") {
                Text(user.registerDateFormat)
                    .font(.body)
                }
                Section("active") {
                HStack {
                    Label("", systemImage: user.isActive ? "checkmark.circle" : "xmark.octagon")
                    
                }
                }
                Section("Friend List") {
                ForEach(user.friends, id: \.id) { friend in
                    NavigationLink(destination: FriendDetail(user: findFriend(id: friend.id), results: results)) {
                     
                        Text(friend.name)
                       
                    }
                    
                }
                }
            }
    }
   
    }
    
    
    
    
    func findFriend(id: String) -> User {
        guard let user = results.first(where: { user in
            user.id == id
        })
        else {
            return results.first!
        }
        
        return user
    }
    
    
    
    
}

struct FriendDetail_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetail(user: User(id: "", name: "", isActive: false, age: 4, company: "", email: "", address: "", about: "", registered: Date.now, tags: [""], friends: [Friend(name: "", id: "")]), results: [User]())
    }
}
