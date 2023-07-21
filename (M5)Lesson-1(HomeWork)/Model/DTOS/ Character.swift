//
//   Character.swift
//  (M5)Lesson-1(HomeWork)
//
//  Created by Ahmed Muvaza on 10/7/23.
//

import Foundation

struct Characters: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}
