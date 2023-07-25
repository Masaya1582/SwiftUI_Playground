//
//  QuoteView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/25.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var quoteViewModel = QuoteViewModel()

    var body: some View {
        VStack {
            if let quote = quoteViewModel.quote {
                Text("\"\(quote.content)\"")
                    .font(.title)
                    .padding()
                Text("- \(quote.author)")
                    .italic()
            } else {
                Text("Loading quote...")
            }
        }
        .onAppear {
            quoteViewModel.fetchQuote()
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
