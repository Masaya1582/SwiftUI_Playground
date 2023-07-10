//
//  SideMenuView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/10.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct SideMenuView: View {

    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool

    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                VStack(alignment: .leading, spacing: 0) {
                    profileImageView()
                        .frame(height: 140)
                        .padding(.bottom, 30)
                    ForEach(SideMenuRowType.allCases, id: \.self) { row in
                        rowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }

                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(
                    Color.white
                )
            }
            Spacer()
        }
        .background(.clear)
    }

    func profileImageView() -> some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Asset.Assets.imgDio.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.purple.opacity(0.5), lineWidth: 10)
                    )
                    .cornerRadius(50)
                Spacer()
            }

            Text("Dio Brando")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)

            Text("iOS Developer")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black.opacity(0.5))
        }
    }

    func rowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (() -> Void)) -> some View {
        Button {
            action()
        } label: {
            VStack(alignment: .leading) {
                HStack(spacing: 20) {
                    Rectangle()
                        .fill(isSelected ? .purple : .white)
                        .frame(width: 5)

                    ZStack {
                        Image(imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isSelected ? .black : .gray)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(isSelected ? .black : .gray)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
            LinearGradient(colors: [isSelected ? .purple.opacity(0.5) : .white, .white], startPoint: .leading, endPoint: .trailing)
        )
    }

}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(selectedSideMenuTab: .constant(0), presentSideMenu: .constant(false))
    }
}
