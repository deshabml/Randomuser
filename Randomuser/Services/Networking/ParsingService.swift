//
//  ParsingService.swift
//  Randomuser
//
//  Created by Лаборатория on 16.05.2023.
//

import Foundation
import SwiftyJSON

class ParsingService {
    static let shared = ParsingService()

    private init() { }

    func users(from data: Data) -> [User]? {
        guard let json = try? JSON(data: data) else { return nil }
        var users: [User] = []
        let jsons = json["results"]
        for index in 0 ..< jsons.count {
            let firstName = jsons[index]["name"]["first"].stringValue
            let lastName = jsons[index]["name"]["last"].stringValue
            let dob = jsons[index]["dob"]["date"].stringValue
            let ege = jsons[index]["dob"]["age"].int
            let email = jsons[index]["email"].stringValue
            let location = jsons[index]["location"]
            let address = location["postcode"].stringValue + ", " + location["city"].stringValue + ", " + location["street"]["name"].stringValue + ", " + location["street"]["number"].stringValue
            let phone = jsons[index]["phone"].stringValue
            let imageUrl = jsons[index]["picture"]["medium"].stringValue
            let imageBigUrl = jsons[index]["picture"]["large"].stringValue
            let userPhoto = User(firstName: firstName,
                                 lastName: lastName,
                                 dob: dob,
                                 age: ege ?? 0,
                                 email: email,
                                 address: address,
                                 phone: phone,
                                 imageUrl: imageUrl,
                                 imageBigUrl: imageBigUrl)
            users.append(userPhoto)
        }
        return users
    }

}
