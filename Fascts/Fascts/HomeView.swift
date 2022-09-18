//
//  HomeView.swift
//  Fascts
//
//  Created by Giga Khizanishvili on 13.09.22.
//

import SwiftUI
import SwiftUIPager

struct HomeView: View {
    // MARK: - Properties
    @State private var isAnswerShown = false
    @State private var fascts: [Fasct] = []

    private var page: Page = .first()
    private let repository: FasctsRepository = DefaultFasctsRepository()

    // MARK: - Body
    var body: some View {
        ZStack {
            Color.indigo
                .opacity(0.6)

            Pager(page: page, data: fascts, id: \.id) { fasct in
                ZStack {
                    Color.clear
                        .contentShape(Rectangle())

                    fasctView(for: fasct)
                }
                .onAppear {
                    isAnswerShown = false
                }
            }
            .sensitivity(.low)
            .vertical()
        }
        .ignoresSafeArea()
        .onAppear {
            fascts = repository.fascts().shuffled()
        }
    }

    private func fasctView(for fasct: Fasct) -> some View {
        VStack {
            Text(fasct.question)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()

            Text(isAnswerShown ? fasct.answer : "-----")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()

            Button(action: {
                isAnswerShown.toggle()
            }, label: {
                Text(isAnswerShown ? "Hide Answer" : "Show Answer")
            })
        }
    }
}

// MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
