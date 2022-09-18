//
//  FasctsRepository.swift
//  Fascts
//
//  Created by Giga Khizanishvili on 13.09.22.
//

import Foundation

protocol FasctsRepository {
    func fascts() -> [Fasct]
}

final class DefaultFasctsRepository: FasctsRepository {
    private let separator = "❓"

    func fascts() -> [Fasct] {
        let filename = "fascts"

        do {
            guard let path = Bundle.main.path(forResource: filename, ofType: "txt") else { return [] }
            let string = try String(contentsOfFile: path, encoding: .utf8)
            let lines = string.components(separatedBy: .newlines).map { $0.trimmed() }

            return lines.compactMap { line in
                let tokens = line.components(separatedBy: .init(charactersIn: separator))
                guard tokens.count >= 2 else { return nil }

                return .init(
                    id: UUID(),
                    question: tokens[0],
                    answer: tokens[1],
                    authorId: nil,
                    creationDate: .now
                )
            }
        } catch {
            fatalError("File '\(filename)' was not opened!")
        }
    }
}
