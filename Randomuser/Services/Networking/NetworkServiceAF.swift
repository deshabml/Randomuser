//
//  NetworkServiceAF.swift
//  Randomuser
//
//  Created by Лаборатория on 16.05.2023.
//

import UIKit
import Alamofire

enum NetworkError: Error {
    case badUrl
    case badResponse
    case invalidDecoding
    case invalidEncoding
    case invalidImageData
}

class NetworkServiceAF {

    static let shared = NetworkServiceAF()

    private init() {}

    func getUserPhoto(page: Int, completion: @escaping (Result<[UserPhoto], Error>)->()) {
        AF.request("https://randomuser.me/api/?page=" + "\(page)" + "&results=2&seed=abc").response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }
            guard let userPhoto = ParsingService.shared.userPhoto(from: data) else { return }
            completion(.success(userPhoto))
        }
    }

    func downloadImage(url: String, completion: @escaping (Result<UIImage, Error>)->()) {
        AF.request(url).response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }
            print(data)
            guard let image = UIImage(data: data) else { return }
            completion(.success(image))
        }
    }

//    func downloadImageAA(url: String) async throws -> UIImage {
//        guard let url = URL(string: url) else { throw NetworkError.badUrl }
//        let response = try await URLSession.shared.data(from: url)
//        let data = response.0
//        print(data)
//        guard let image = UIImage(data: data) else { throw NetworkError.invalidImageData }
//        return image
//    }

}
