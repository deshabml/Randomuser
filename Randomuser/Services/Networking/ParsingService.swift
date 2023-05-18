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
            let address = jsons[index]["location"]["postcode"].stringValue + ", " + jsons[index]["location"]["city"].stringValue + ", " + jsons[index]["location"]["street"]["name"].stringValue + ", " + jsons[index]["location"]["street"]["number"].stringValue
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
        print(json)
//        print("---------------")
        print(users)
//        print("---------------")
        return users
    }


}


//{
//  "results": [
//    {
//      "gender": "female",
//      "name": {
//        "title": "Miss",
//        "first": "Jennie",
//        "last": "Nichols"
//      },
//      "location": {
//        "street": {
//          "number": 8929,
//          "name": "Valwood Pkwy",
//        },
//        "city": "Billings",
//        "state": "Michigan",
//        "country": "United States",
//        "postcode": "63104",
//        "coordinates": {
//          "latitude": "-69.8246",
//          "longitude": "134.8719"
//        },
//        "timezone": {
//          "offset": "+9:30",
//          "description": "Adelaide, Darwin"
//        }
//      },
//      "email": "jennie.nichols@example.com",
//      "login": {
//        "uuid": "7a0eed16-9430-4d68-901f-c0d4c1c3bf00",
//        "username": "yellowpeacock117",
//        "password": "addison",
//        "salt": "sld1yGtd",
//        "md5": "ab54ac4c0be9480ae8fa5e9e2a5196a3",
//        "sha1": "edcf2ce613cbdea349133c52dc2f3b83168dc51b",
//        "sha256": "48df5229235ada28389b91e60a935e4f9b73eb4bdb855ef9258a1751f10bdc5d"
//      },
//      "dob": {
//        "date": "1992-03-08T15:13:16.688Z",
//        "age": 30
//      },
//      "registered": {
//        "date": "2007-07-09T05:51:59.390Z",
//        "age": 14
//      },
//      "phone": "(272) 790-0888",
//      "cell": "(489) 330-2385",
//      "id": {
//        "name": "SSN",
//        "value": "405-88-3636"
//      },
//      "picture": {
//        "large": "https://randomuser.me/api/portraits/men/75.jpg",
//        "medium": "https://randomuser.me/api/portraits/med/men/75.jpg",
//        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/75.jpg"
//      },
//      "nat": "US"
//    }
//  ],
//  "info": {
//    "seed": "56d27f4a53bd5441",
//    "results": 1,
//    "page": 1,
//    "version": "1.4"
//  }
//}
