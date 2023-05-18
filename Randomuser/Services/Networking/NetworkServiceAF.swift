//
//  NetworkServiceAF.swift
//  Randomuser
//
//  Created by Лаборатория on 16.05.2023.
//

import UIKit
import Alamofire

class NetworkServiceAF {

    static let shared = NetworkServiceAF()

    private init() {}

    func getUsers(page: Int, completion: @escaping (Result<[User], Error>)->()) {
        AF.request("https://randomuser.me/api/?page=" + "\(page)" + "&results=2&seed=abc").response { response in
            guard let data = response.data else {
                if let error = response.error {
                    completion(.failure(error))
                }
                return
            }
            guard let users = ParsingService.shared.users(from: data) else { return }
            completion(.success(users))
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
            guard let image = UIImage(data: data) else { return }
            completion(.success(image))
        }
    }

}
