//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum FocusField: String, RawRepresentable {
    case first
    case second
}

struct HomeView: View {
    @State private var firstValue: String = ""
    @State private var secondValue: String = ""
    @FocusState private var focusField: FocusField?

    var body: some View {
        ZStack {
            Color.gray.opacity(0.4)
                .ignoresSafeArea()
            VStack(spacing: 32) {
                Text("Focus Status: \(focusField?.rawValue ?? "Unfocused" )")
                    .font(.system(size: 24, weight: .bold))

                TextField("First TextField", text: $firstValue)
                    .focused($focusField, equals: .first)
                    .textFieldStyle(.roundedBorder)

                TextField("Second TextField", text: $secondValue)
                    .focused($focusField, equals: .second)
                    .textFieldStyle(.roundedBorder)

                Button(action: {
                    focusField = .first
                }, label: {
                    Text("Focus on First")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 300, height: 60, alignment: .center)
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(12)
                })

                Button(action: {
                    focusField = .second
                }, label: {
                    Text("Focus on Second")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 300, height: 60, alignment: .center)
                        .foregroundColor(.white)
                        .background(.yellow)
                        .cornerRadius(12)
                })

                Button(action: {
                    focusField = nil
                }, label: {
                    Text("UnFocus TextField")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 300, height: 60, alignment: .center)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(12)
                })
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
