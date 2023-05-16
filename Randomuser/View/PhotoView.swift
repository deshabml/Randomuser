//
//  ContentView.swift
//  Randomuser
//
//  Created by Лаборатория on 16.05.2023.
//

import SwiftUI

struct PhotoView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
