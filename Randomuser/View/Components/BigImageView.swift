//
//  BigImageView.swift
//  Randomuser
//
//  Created by Лаборатория on 17.05.2023.
//

import SwiftUI

struct BigImageView: View {

    @EnvironmentObject var mainViewModel: PhotoViewModel
    @StateObject var viewModel: BigImageViewModel

    var body: some View {
        ZStack {
            Image(uiImage: viewModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
            VStack {
                HStack {
                    Spacer()
                    Button {
                        mainViewModel.viewProfile(isFirst: viewModel.isFirst)
                    } label: {
                        Image("PrifileIcon")
                            .resizable()
                            .frame(width: 55, height: 70)
                            .foregroundColor(Color("MainThemeColor"))
                            .padding(10)
                    }
                }
                Spacer()
                Button {
                    mainViewModel.nextPage()
                } label: {
                    Image(systemName: "star.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color("MainThemeColor"))
                        .padding(10)
                }
            }
        }
    }
    
}

struct BigImageView_Previews: PreviewProvider {
    static var previews: some View {
        BigImageView(viewModel: BigImageViewModel(isFirst: true))
    }
}
