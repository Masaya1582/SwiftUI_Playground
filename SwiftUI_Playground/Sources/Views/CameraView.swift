//
//  CameraView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/09/10.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @State private var isShowingRearCamera = true
    @State private var session: AVCaptureSession?

    var body: some View {
        VStack {
            CameraPreview(session: $session)
                .onAppear {
                    setupCamera()
                }

            Button(action: {
                toggleCamera()
            }) {
                Text(isShowingRearCamera ? "Switch to Front Camera" : "Switch to Rear Camera")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }

    func setupCamera() {
        session = AVCaptureSession()
        guard let session = session else { return }

        if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: isShowingRearCamera ? .back : .front) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
            } catch {
                print(error.localizedDescription)
            }

            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.frame = UIScreen.main.bounds
            previewLayer.videoGravity = .resizeAspectFill

            let uiView = UIView(frame: UIScreen.main.bounds)
            uiView.layer.addSublayer(previewLayer)

            DispatchQueue.global(qos: .userInitiated).async {
                session.startRunning()
            }
        }
    }

    func toggleCamera() {
        session?.stopRunning()
        isShowingRearCamera.toggle()
        setupCamera()
    }
}

struct CameraPreview: UIViewRepresentable {
    @Binding var session: AVCaptureSession?

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        if let session = session {
            for subview in uiView.subviews {
                subview.removeFromSuperview()
            }

            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.frame = uiView.bounds
            previewLayer.videoGravity = .resizeAspectFill
            uiView.layer.addSublayer(previewLayer)
        }
    }
}
