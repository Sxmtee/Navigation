//
//  RootNavPath.swift
//  Navigation
//
//  Created by mac on 13/09/2024.
//

//How to make a NavigationStack return to its root view programmatically

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self, from: data
            ) {
                path = NavigationPath(decoded)
                return
            }
        }

        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}


struct DetailView: View {
    var number: Int
//    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number \(number)")
//            .toolbar {
//                Button("Home") {
//                    path.removeAll()
//                }
//            }
    }
}

struct RootNavPath: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                        DetailView(number: i)
                }
        }
    }
}

#Preview {
    RootNavPath()
}
