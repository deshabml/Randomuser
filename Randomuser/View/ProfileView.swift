//
//  ProfileView.swift
//  Randomuser
//
//  Created by Лаборатория on 17.05.2023.
//

import SwiftUI

struct ProfileView: View {

    @StateObject var viewModel: ProfileViewModel

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(spacing: 16) {
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .cornerRadius(75)
                    VStack(alignment: .leading) {
                        Text(viewModel.fullName())
                            .font(.custom("AvenirNext-Bold",
                                          size: 16))
                            .bold()
                            .padding(4)
                        Text(viewModel.fullDob())
                            .font(.custom("AvenirNext",
                                          size: 14))
                            .padding(4)
                        Text(viewModel.user.email)
                            .font(.custom("AvenirNext",
                                          size: 14))
                            .padding(4)
                    }
                }
            }
            Button {
                viewModel.showPhoneCallAction()
            } label: {
                HStack {
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Позвонить")
                        .font(.custom("AvenirNext-Bold",
                                      size: 20))
                }
                .foregroundColor(.black)

            }
            .frame(width: 200, height: 60)
            .background(Color("MainThemeColor"))
            .cornerRadius(30)
            .padding(.vertical, 16)
            HStack {
                Text(viewModel.user.address)
                    .font(.custom("AvenirNext",
                                  size: 16))
                    .frame(width: 200)
                    .padding(.vertical, 50)
                Spacer()
            }

            Spacer()
        }
        .padding()
        .confirmationDialog("Вызов", isPresented: $viewModel.showPhoneCall, actions: {
            Text(viewModel.user.phone)
                .font(.custom("AvenirNext-Bold",
                              size: 20))
                .foregroundColor(.black)
            Button {
                viewModel.phoneCallAction()
            } label: {
                Text("Вызов")
                    .font(.custom("AvenirNext-Bold",
                                  size: 20))
                    .foregroundColor(.black)
            }
            Button(role: .cancel) { } label: {
                Text("Отмена")
                    .font(.custom("AvenirNext-Bold",
                                  size: 20))
                    .foregroundColor(.black)
            }
            .border(Color.black, width: 2)
        }, message: {
            Text(viewModel.user.phone)
                .font(.custom("AvenirNext-Bold",
                              size: 20))
                .foregroundColor(.blue)
        })
        .foregroundColor(.black)
        .onAppear {
            viewModel.loadScreen()
        }
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(user: User(firstName: "Ivan",
                                                           lastName: "Ivanov",
                                                           dob: "1985-13-29",
                                                           age: 0,
                                                           email: "dsedf@sdfdsf.ru",
                                                           address: "99553, Falkenberg/Elster, Grüner Weg, 6167",
                                                           phone: "8 888 888 88 88",
                                                           imageUrl: "https://randomuser.me/api/portraits/women/88.jpg",
                                                           imageBigUrl: "https://randomuser.me/api/portraits/women/88.jpg")))
    }
}
