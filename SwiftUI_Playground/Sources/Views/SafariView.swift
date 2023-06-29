//
//  SafariView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/30.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    let onDismiss: (() -> Void)?

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.dismissButtonStyle = .done
        safariViewController.delegate = context.coordinator
        return safariViewController
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(onDismiss: onDismiss)
    }

    final class Coordinator: NSObject, SFSafariViewControllerDelegate {
        let onDismiss: (() -> Void)?

        init(onDismiss: (() -> Void)? = nil) {
            self.onDismiss = onDismiss
        }

        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            onDismiss?()
        }
    }
}
