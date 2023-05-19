//
//  ConfirmationDialogElement.swift
//  Randomuser
//
//  Created by Лаборатория on 18.05.2023.
//

import SwiftUI

struct ConfirmationDialogElement: ViewModifier {

    @Binding var showPhoneCall: Bool
    var phone: String
    var completion: ()->()

    func body(content: Content) -> some View {
        content
            .confirmationDialog("Вызов", isPresented: $showPhoneCall, actions: {
                Button {
                    completion()
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
                Text(phone)
                    .font(.custom("AvenirNext-Bold",
                                  size: 20))
                    .foregroundColor(.blue)
            })
    }

}
