//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let presidents: [String] = ["Joe Biden", "Donald Trump", "George W. Bush"]
    @State private var resultString = "Left or Right"

    var body: some View {
        VStack {
            List(presidents, id: \.self) { president in
                HStack(alignment: .center) {
                    Text(president)
                    Spacer()
                    Button {
                        resultString = "\(president) Left"
                    } label: {
                        Text("Left")
                            .padding()
                            .border(Color.black)
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button {
                        resultString = "\(president) Right"
                    } label: {
                        Text("Right")
                            .padding()
                            .border(Color.black)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    resultString = "\(president) Cell"
                }
            }
            Text(resultString)
                .font(.custom(FontFamily.Caprasimo.regular, size: 28))
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
