//
//  ContentView.swift
//  Project10-CupcakeCorner(100SUI)
//
//  Created by Artem on 19.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    struct Response: Codable {
        var results: [Result]
    }
    
    struct Result: Codable {
        var trackId: Int
        var trackName: String
        var collectionName: String
    }
    
    @State private var results = [Result]()
    
    final class User: ObservableObject, Codable {
       @Published var name = "Artem Moiseev"
        
        enum CodingKeys: CodingKey {
            case name
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
        }
    }
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=john+mayer&entity=song") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
  

