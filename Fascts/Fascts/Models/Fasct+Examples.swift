//
//  Fasct+Examples.swift
//  Fascts
//
//  Created by Giga Khizanishvili on 13.09.22.
//

import Foundation

extension Fasct {
    private static let authorId = UUID(uuidString: "8f087eaa-8d76-449b-8360-d58222db8d8c")!

    static var example: Fasct { examples[0] }

    static let examples = [
        Fasct(
            id: UUID(uuidString: "5ee1cd87-d4c3-40e0-aefc-d60e6fd8392e")!,
            question: "რომელ წელს შეიქმნა 'Fascts'?",
            answer: "2022",
            authorId: authorId,
            creationDate: .now,
            category: .history
        ),
        Fasct(
            id: UUID(uuidString: "230d8dd0-335e-11ed-a261-0242ac120002")!,
            question: "რომელ წელს მოხდა დიდგორი ბრძოლა?",
            answer: "1121",
            authorId: authorId,
            creationDate: .now,
            category: .history
        )
    ]
}
