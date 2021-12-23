//
//  ContentView.swift
//  FriendFaceMilestone
//
//  Created by Amit Shrivastava on 22/12/21.
//

import SwiftUI

struct FriendFace: View {
    @State private var results = [User]()
    var body: some View {
        NavigationView {
            List{
                ForEach(results, id: \.id) { item in
                    NavigationLink(destination: FriendDetail(user: item, results: results)) {
                        HStack {
                            Text(item.name)
                                .font(.title)
                            Image(systemName: item.isActive ? "checkmark.circle.fill" : "xmark.octagon.fill")
                            .foregroundColor(item.isActive ? Color.green : Color.gray)
                        }
                    }
                }
            }
            .navigationTitle("Friend Face")
            .task {
                await loadData()
            }
        }
    }
    func loadData() async {
    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("no file found")
            return
        }
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        do {
           
            let (data, _) = try await URLSession.shared.data(from: url)
            if let dataDecoded = try? jsonDecoder.decode([User].self, from: data) {
                self.results = dataDecoded
            }
            
        }
        
        catch {
            fatalError("cannot load data")
        }
        
        
    }
    
}

struct FriendFace_Previews: PreviewProvider {
    static var previews: some View {
        FriendFace()
    }
}
