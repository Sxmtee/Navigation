//
//  CustomNavBar.swift
//  Navigation
//
//  Created by mac on 21/09/2024.
//

import SwiftUI

struct CustomNavBar: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            List (0..<100) { i in
                Text("Row \(i)")
//                    .toolbar {
//                        ToolbarItemGroup(placement: .topBarLeading) {
//                            Button("Tap Me") {
//                                //some Action
//                            }
//                            
//                            Button("Tap Me Again") {
//                                //some Action
//                            }
//                        }
//                    }
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
        }
    }
}

#Preview {
    CustomNavBar()
}
