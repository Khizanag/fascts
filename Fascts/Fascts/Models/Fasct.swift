//
//  Fasct.swift
//  Fascts
//
//  Created by Giga Khizanishvili on 13.09.22.
//

import Foundation

struct Fasct {
    let id: UUID
    let question: String
    let answer: String
    let authorId: UUID?
    let creationDate: Date
    let category: Category
}

extension Fasct: Equatable { }
