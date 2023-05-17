//
//  BigImageViewModel.swift
//  Randomuser
//
//  Created by Лаборатория on 17.05.2023.
//

import UIKit

class BigImageViewModel: ObservableObject {

    @Published var image = UIImage(systemName: "photo") ?? UIImage()
    let isFirst: Bool

    init(isFirst: Bool) {
        self.isFirst = isFirst
    }

    func setupImage(image: UIImage) {
        self.image = image
    }

}
