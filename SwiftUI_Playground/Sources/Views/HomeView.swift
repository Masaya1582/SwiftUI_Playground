//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var phoneNumber: String = ""
    private let buttons = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["*", "0", "#"]
    ]

    var body: some View {
        VStack {
            Spacer()
            Text(phoneNumber)
                .modifier(CustomLabel(foregroundColor: .black, size: 32))

            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { digit in
                        Button(action: {
                            self.phoneNumber.append(digit)
                        }) {
                            Text(digit)
                                .font(.title)
                                .frame(width: self.buttonWidth(), height: self.buttonHeight())
                                .foregroundColor(.black)
                                .background(Asset.Colors.gray9.swiftUIColor)
                                .cornerRadius(self.buttonWidth() / 2)
                        }
                    }
                }
            }
            Spacer()
            Button(action: {
                if !self.phoneNumber.isEmpty {
                    self.phoneNumber.removeLast()
                }
            }) {
                Image(systemName: "delete.left")
                    .font(.title)
                    .frame(width: self.buttonWidth(), height: self.buttonHeight())
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(self.buttonWidth() / 2)
            }
            Spacer()
        }
        .padding()
    }

    private func buttonWidth() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return (screenWidth - 4 * 12) / 3
    }

    private func buttonHeight() -> CGFloat {
        return buttonWidth()
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
