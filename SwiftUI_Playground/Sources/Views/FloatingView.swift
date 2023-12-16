//
//  FloatingView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.

import SwiftUI

struct FloatingView: View {
    @State var dismissAction: (() -> Void)

    var body: some View {
        VStack {
            closeButton
            sampleView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, 32)
        .padding(28)
        .background(
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
        )
        .onTapGesture {
            dismissAction()
        }
    }

    /// 右上のバツボタン
    var closeButton: some View {
        HStack {
            Spacer()
            Button(action: dismissAction) {
                Asset.Assets.imgHeadback.swiftUIImage
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 48, height: 48)
            .padding(2)
        }
    }

    /// 全体のView
    var sampleView: some View {
        VStack(spacing: 42) {
            Text("Floating View")
                .modifier(CustomLabel(foregroundColor: .black, size: 32))
            Asset.Assets.imgFrance.swiftUIImage
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 80)
            mainCloseButton
        }
        .padding(20)
        .background(.white)
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
    }

    /// メインの閉じるボタン
    var mainCloseButton: some View {
        Button(action: {
            dismissAction()
        }, label: {
            Text("Close")
                .modifier(CustomLabel(foregroundColor: .white, size: 32))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        })
        .background(.green)
        .cornerRadius(80)
        .frame(height: 60)
    }
}

struct FloatingView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingView(dismissAction: {})
    }
}
