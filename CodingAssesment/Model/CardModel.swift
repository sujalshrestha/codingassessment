//
//  TestModel.swift
//  CodingAssement
//
//  Created by Macbook air on 25/04/2024.
//

import Foundation

struct CardModel: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
