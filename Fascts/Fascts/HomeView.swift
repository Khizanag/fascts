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
                .opacity(0.5)

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
            Text(fasct.question + "?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding()

            Divider()

            Text(isAnswerShown ? fasct.answer : "-----")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()

            Divider()

            Button(action: {
                isAnswerShown.toggle()
            }, label: {
                Text(isAnswerShown ? "Hide Answer" : "Show Answer")
            })
            .foregroundColor(.cyan)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.indigo.opacity(0.7))
            .cornerRadius(12)
            .padding()
        }
    }
}

// MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
