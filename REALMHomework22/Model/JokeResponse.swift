//
//  JokeResponse.swift
//  REALMHomework22
//
//  Created by Айгерим on 19.09.2024.
//

import Foundation
import UIKit

struct JokeResponse: Decodable {
    let categories: [String]?
    let created_at: String?
    let id: String?
    let value: String?
    
    var createdAt: String? {
        return created_at
    }
}
