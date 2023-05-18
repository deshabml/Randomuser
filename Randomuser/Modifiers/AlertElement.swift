//
//  AlertElement.swift
//  Randomuser
//
//  Created by Лаборатория on 18.05.2023.
//

import SwiftUI

struct AlertElement: ViewModifier {

    var text: String
    @Binding var switchAlert: Bool

    func body(content: Content) -> some View {
        content
            .alert(text, isPresented: $switchAlert) {
                Button("ОК") { }
            }
    }

}
