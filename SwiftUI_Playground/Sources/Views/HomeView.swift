//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var rating: Int = 5
    @State private var feedbackText: String = ""
    @State private var isSubmitted: Bool = false

    var body: some View {
        VStack {
            Text("Feedback Form")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
                .padding(.bottom, 20)

            Text("How much do you like our app?")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))

            HStack {
                ForEach(1...5, id: \.self) { index in
                    Button {
                        self.rating = index
                    } label: {
                        Image(systemName: index <= rating ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.yellow)
                    }
                }
            }

            Text("Tell us why you like it or how we can improve:")
                .modifier(CustomLabel(foregroundColor: .black, size: 16))
                .padding(.top, 20)

            TextEditor(text: $feedbackText)
                .frame(minHeight: 100)
                .cornerRadius(10)
                .border(Color.gray, width: 1)
                .padding(.horizontal)
                .padding(.bottom, 20)

            Button {
                self.isSubmitted = true
            } label: {
                Text("Submit Feedback")
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .green))
            .disabled(feedbackText.isEmpty)

            if isSubmitted {
                Text("Thank you for your feedback!")
                    .modifier(CustomLabel(foregroundColor: .black, size: 14))
                    .padding(.top, 20)
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
