//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var id: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?

    enum Field {
        case id, password
    }

    var body: some View {
        VStack(spacing: 30) {
            CustomTextFields(placeholder: "ID", text: $id, focusedField: _focusedField, currentField: .id)
            CustomTextFields(placeholder: "Password", text: $password, focusedField: _focusedField, currentField: .password, isSecure: true)
        }
        .padding()
    }
}

struct CustomTextFields: View {
    var placeholder: String
    @Binding var text: String
    @FocusState var focusedField: HomeView.Field?
    var currentField: HomeView.Field
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(placeholder)
                .foregroundColor(text.isEmpty ? .gray : .accentColor)
                .offset(y: text.isEmpty ? 0 : -20)
                .scaleEffect(text.isEmpty ? 1 : 0.75, anchor: .leading)
                .animation(.easeInOut(duration: 0.2), value: text.isEmpty)

            if isSecure {
                SecureField("", text: $text)
                    .focused($focusedField, equals: currentField)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(focusedField == currentField ? Color.accentColor : Color.gray, lineWidth: 2)
                            .animation(.easeInOut(duration: 0.2), value: focusedField == currentField)
                    )
            } else {
                TextField("", text: $text)
                    .focused($focusedField, equals: currentField)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(focusedField == currentField ? Color.accentColor : Color.gray, lineWidth: 2)
                            .animation(.easeInOut(duration: 0.2), value: focusedField == currentField)
                    )
            }
        }
        .padding(.top, text.isEmpty ? 0 : 15)
        .animation(.easeInOut(duration: 0.2), value: text.isEmpty)
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
