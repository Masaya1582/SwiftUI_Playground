//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    @State private var isFlashlightOn = false

    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: isFlashlightOn ? "flashlight.on.fill" : "flashlight.off.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Button(action: {
                toggleFlashlight()
            }) {
                Text(isFlashlightOn ? "Turn Off" : "Turn On")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 28, alignment: .center)
                    .padding()
                    .background(isFlashlightOn ? Color.red : Color.green)
                    .cornerRadius(10)
            }
        }
    }

    private func toggleFlashlight() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        if let device = device, device.hasTorch {
            do {
                try device.lockForConfiguration()
                device.torchMode = isFlashlightOn ? .off : .on
                device.unlockForConfiguration()
                isFlashlightOn.toggle()
            } catch {
                print("Torch could not be used.")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
