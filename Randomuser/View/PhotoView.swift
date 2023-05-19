//
//  ContentView.swift
//  Randomuser
//
//  Created by Лаборатория on 16.05.2023.
//

import SwiftUI

struct PhotoView: View {

    @StateObject var viewModel = PhotoViewModel()

    var body: some View {
        VStack {
            BigImageView(viewModel: viewModel.oneBigImageViewModel)
                .environmentObject(viewModel)
            BigImageView(viewModel: viewModel.secondBigImageViewModel)
                .environmentObject(viewModel)
        }
        .padding()
        .modifier(AlertElement(text: viewModel.textErrorAlert,
                               switchAlert: $viewModel.showErrorAlert))
        .onAppear {
            viewModel.loadScreen()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
