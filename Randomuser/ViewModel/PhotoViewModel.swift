//
//  PhotoViewModel.swift
//  Randomuser
//
//  Created by Лаборатория on 17.05.2023.
//

import UIKit

class PhotoViewModel: ObservableObject {

    @Published var users: [User] = []
    @Published var oneBigImageViewModel = BigImageViewModel(isFirst: true)
    @Published var secondBigImageViewModel = BigImageViewModel(isFirst: false)
    @Published var isGetComleted = false
    @Published var showErrorAlert = false
    @Published var textErrorAlert = ""
    var page: Int = 1

    func loadScreen() {
        getData()
    }

    func nextPage() {
        page += 1
        getData()
    }

    func getData() {
        NetworkServiceAF.shared.getUsers(page: page) { result in
            switch result {
                case .success(let posts):
                    DispatchQueue.main.async {
                        self.users = posts
                        self.getImage(url: self.users[0].imageBigUrl, numberImage: 1)
                        self.getImage(url: self.users[1].imageBigUrl, numberImage: 2)
                        self.isGetComleted = true
                    }
                case .failure(let error):
                    self.textErrorAlert = error.localizedDescription
                    self.showErrorAlert.toggle()
            }
        }
    }

    func getImage(url: String, numberImage: Int) {
        NetworkServiceAF.shared.downloadImage(url: url) { result in
            switch result {
                case .success(let getImage):
                    DispatchQueue.main.async {
                        switch numberImage {
                            case 1:
                                self.oneBigImageViewModel.setupImage(image: getImage)
                            default:
                                self.secondBigImageViewModel.setupImage(image: getImage)
                        }
                    }
                case .failure(let error):
                    self.textErrorAlert = error.localizedDescription
                    self.showErrorAlert.toggle()
            }
        }
    }

}
