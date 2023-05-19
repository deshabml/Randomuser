//
//  ProfileViewModel.swift
//  Randomuser
//
//  Created by Лаборатория on 17.05.2023.
//

import UIKit

class ProfileViewModel: ObservableObject {

    @Published var user: User
    @Published var image = UIImage(systemName: "photo") ?? UIImage()
    @Published var showPhoneCall = false

    init(user: User) {
        self.user = user
    }

    func loadScreen() {
        getImage()
    }

    func fullName() -> String {
        user.firstName + " " + user.lastName
    }

    func showPhoneCallAction() {
        showPhoneCall.toggle()
    }

    func phoneCallAction() {
        let telephone = "tel://"
        let formattedString = telephone + user.phone
        guard let url = URL(string: formattedString) else { return }
        UIApplication.shared.open(url)
    }

    func fullDob() -> String {
        guard user.dob.count >= 10 else { return "(\(user.age) лет)" }
        let dob = Array(user.dob).map{ String($0) }
        let date = dob[8] + dob[9] + "." + dob[5] + dob[6] + "." + dob[0] + dob[1] + dob[2] + dob[3]
        return date + " (\(user.age) лет)"
    }

    func getImage() {
        NetworkServiceAF.shared.downloadImage(url: user.imageUrl) { result in
            switch result {
                case .success(let getImage):
                    DispatchQueue.main.async {
                        self.image = getImage
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }

}
