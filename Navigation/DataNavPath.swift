//
//  DataNavPath.swift
//  Navigation
//
//  Created by mac on 13/09/2024.
//

//Navigating to different data types using NavigationPath
import SwiftUI

struct DataNavPath: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack (path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                    Text("You selected \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                    Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    DataNavPath()
}
