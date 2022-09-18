//
//  FasctsRepository.swift
//  Fascts
//
//  Created by Giga Khizanishvili on 13.09.22.
//

import Foundation

protocol FasctsRepository {
    func fascts(categories: Set<Category>) -> [Fasct]
}

final class DefaultFasctsRepository: FasctsRepository {
    private let separator = "❓"
    private let categorySeparator = "🐢"

    /// if all `categories` contains `.all`, then every category is returned
    func fascts(categories: Set<Category> = [.all]) -> [Fasct] {
        let filename = "fascts"

        do {
            guard let path = Bundle.main.path(forResource: filename, ofType: "txt") else { return [] }
            let string = try String(contentsOfFile: path, encoding: .utf8)

            var currentCategory: Category = .art

            let lines = string.components(separatedBy: .newlines).map { $0.trimmed() }

            let fascts: [Fasct] = lines.compactMap { line in
                let tokens = line.components(separatedBy: .init(charactersIn: separator))

                guard tokens.count == 2 else {
                    let categoryTokens = line.components(separatedBy: .init(charactersIn: categorySeparator)).filter { !$0.isEmpty }
                    if let categoryName = categoryTokens.first?.lowercased().trimmed(),
                       let category = Category(rawValue: categoryName)
                    {
                        currentCategory = category
                    }
                    return nil
                }

                return Fasct(
                    id: UUID(),
                    question: tokens[0],
                    answer: tokens[1],
                    authorId: nil,
                    creationDate: .now,
                    category: currentCategory
                )
            }

            let isAllCategorySelected = categories.contains(.all)

            return fascts.filter {
                 isAllCategorySelected || categories.contains($0.category)
            }
        } catch {
            fatalError("File '\(filename)' was not opened!")
        }
    }
}
