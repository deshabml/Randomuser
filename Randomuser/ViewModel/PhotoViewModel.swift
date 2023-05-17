//
//  PhotoViewModel.swift
//  Randomuser
//
//  Created by Лаборатория on 17.05.2023.
//

import UIKit

class PhotoViewModel: ObservableObject {

    @Published var oneBigImageViewModel = BigImageViewModel(isFirst: true)
    @Published var secondBigImageViewModel = BigImageViewModel(isFirst: false)
    var page: Int = 1

    func loadScreen() {
        getData()
    }

    func nextPage() {
        page += 1
        getData()
    }

    func viewProfile(isFirst: Bool) {
        if isFirst {
            print("first")
        } else {
            print("second")
        }
    }

    func getData() {
        NetworkServiceAF.shared.getUserPhoto(page: page) { result in
            switch result {
                case .success(let posts):
                    DispatchQueue.main.async {
                        let userPhotos = posts
                        self.getImage(url: userPhotos[0].url, numberImage: 1)
                        self.getImage(url: userPhotos[1].url, numberImage: 2)
                    }
                case .failure(let error):
                    print(error)
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
                    print(error)
            }
        }
    }

}
