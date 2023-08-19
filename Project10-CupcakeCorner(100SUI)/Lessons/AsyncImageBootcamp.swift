//
//  AsyncImageBootcamp.swift
//  Project10-CupcakeCorner(100SUI)
//
//  Created by Artem on 19.08.2023.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//            Color.red
//        }
//        .frame(width: 200, height: 200)
//        }
        
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
            }
        .frame(width: 200, height: 200)
        }
    }


struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
