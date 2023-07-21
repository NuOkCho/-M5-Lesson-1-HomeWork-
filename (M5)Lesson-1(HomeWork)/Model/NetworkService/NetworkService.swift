//
//  NetworkService.swift
//  (M5)Lesson-1(HomeWork)
//
//  Created by Ahmed Muvaza on 10/7/23.
//

import Foundation

struct NetworkService {
    
    enum RickAndMortyError: Error {
        case UFO
    }
    
    static let shared = NetworkService()
    
    func fetchCharacter(
        completion: @escaping
        (Result<[Character], RickAndMortyError>) -> Void
    ) {
        let request = URLRequest(
            url: Contants
                .API
                .baseURL
                .appendingPathComponent("character")
        )
        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in
            guard let data else {
                return
            }
            do {
                let model = try JSONDecoder().decode(
                    Characters.self,
                    from: data
                )
                completion(.success(model.results))
            } catch {
                completion(.failure(.UFO))
            }
        }
        .resume()
    }
}
