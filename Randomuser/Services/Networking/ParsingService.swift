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

    func userPhoto(from data: Data) -> [UserPhoto]? {
        guard let json = try? JSON(data: data) else { return nil }
        var userPhotos: [UserPhoto] = []
        let jsons = json["results"]
        for index in 0 ..< jsons.count {
            let name = jsons[index]["name"]["first"].stringValue
            let url = jsons[index]["picture"]["large"].stringValue
            print(name)
            print(url)
            let userPhoto = UserPhoto(url: url)
            userPhotos.append(userPhoto)
        }
        let url = json["name"]["first"].stringValue
        print("---------------")
        print(url)
        print("---------------")
        print(json["results"][0]["picture"]["large"])
        print("---------------")



//        }
//        let url = json["results"]["picture"]["large"].stringValue
//        let userPhoto = UserPhoto(url: url)
        return userPhotos
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
