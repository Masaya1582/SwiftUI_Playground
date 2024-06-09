//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

struct NetworkErrorToastView: View {
    var message: String

    var body: some View {
        Text(message)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
    }
}

class ToastViewModel: ObservableObject {
    @Published var showToast: Bool = false

    func showToastForDuration(duration: Double = 2.0) {
        showToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.showToast = false
        }
    }
}

struct HomeView: View {
    @StateObject private var toastViewModel = ToastViewModel()

    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    toastViewModel.showToastForDuration()
                }) {
                    Text("Tap to Show Network Error")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
            if toastViewModel.showToast {
                VStack {
                    Spacer()
                    NetworkErrorToastView(message: "Network Error: Unable to connect.")
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
            }
        }
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
