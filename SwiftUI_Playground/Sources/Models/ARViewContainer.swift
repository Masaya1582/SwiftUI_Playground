//
//  ARViewContainer.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/09/05.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)

        // Configure AR session
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal]
        arView.session.run(configuration)

        // Add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}

    // MARK: - Coordinator
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: ARViewContainer

        init(_ parent: ARViewContainer) {
            self.parent = parent
        }

        @objc func handleTap(_ sender: UITapGestureRecognizer) {
            guard let arView = sender.view as? ARView else { return }

            // Get the tap location
            let tapLocation = sender.location(in: arView)

            // Perform a hit test to find surfaces
            let results = arView.hitTest(tapLocation, types: .existingPlaneUsingExtent)

            if let firstResult = results.first {
                // Get the position of the hit test
                let position = simd_make_float3(firstResult.worldTransform.columns.3)

                // Create a simple box entity
                let box = MeshResource.generateBox(size: 0.2)
                let material = SimpleMaterial(color: .blue, isMetallic: true)
                let boxEntity = ModelEntity(mesh: box, materials: [material])

                // Set the position of the box
                boxEntity.position = position

                // Add the box to the scene
                let anchorEntity = AnchorEntity(world: position)
                anchorEntity.addChild(boxEntity)
                arView.scene.addAnchor(anchorEntity)
            }
        }
    }
}
