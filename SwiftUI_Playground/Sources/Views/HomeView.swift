//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var title: String = "Count"
    @State private var number: Int = 0
    @State private var showImage: Bool = false

    var body: some View {
        Text("\(title): \(number)")
            .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                number += 1
                showImage = number.isMultiple(of: 3) || String(number).contains("3")
            }
        if showImage {
            Asset.Assets.imgNabeatsu.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

extension NSNotification.Name {
    public static let deviceDidShakeNotification = NSNotification.Name("DeviceDidShakeNotification")
}
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
