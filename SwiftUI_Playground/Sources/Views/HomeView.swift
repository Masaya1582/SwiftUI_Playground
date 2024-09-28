//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    // MARK: - Properties
    @StateObject private var homeviewModel = HomeViewModel()
    @StateObject private var pokemonViewModel = PokemonViewModel()

    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                backgroundField()
                VStack(spacing: 4) {
                    topField()
                    middleField()
                    bottomField()
                    NavigationLink(destination: UserDetailView()) {
                        Text("Navigation遷移")
                    }
                }
            }
        }
        .onAppear {
            let randomID = Int.random(in: 1 ... 10)
            homeviewModel.fetchPosts()
            pokemonViewModel.fetchPokemon(id: randomID)
        }
        .fullScreenCover(isPresented: $homeviewModel.isOpenImagePicker) {
            ImagePicker(selectedImage: $homeviewModel.selectedImage, sourceType: homeviewModel.sourceType ?? .photoLibrary)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $homeviewModel.isShowHalfModalView) {
            HalfModalView(halfModalText: $homeviewModel.halfModalText, isShowHalfView: $homeviewModel.isShowHalfModalView)
                .presentationDetents([.medium])
        }
        .alert(isPresented: $homeviewModel.isShowSourceTypeAlert) {
            Alert(
                title: Text("Choose SourceType"),
                message: nil,
                primaryButton: .default(Text("Camera")) {
                    homeviewModel.sourceType = .camera
                    homeviewModel.isOpenImagePicker = true
                },
                secondaryButton: .default(Text("Library")) {
                    homeviewModel.sourceType = .photoLibrary
                    homeviewModel.isOpenImagePicker = true
                }
            )
        }
    }

    @ViewBuilder
    private func topField() -> some View {
        Text("API Fetched Pokemon: \(pokemonViewModel.pokemon?.name ?? "")")
            .modifier(CustomLabel(foregroundColor: .black, size: 16))
    }

    @ViewBuilder
    private func middleField() -> some View {
        if let image = homeviewModel.selectedImage {
            Image(uiImage: image)
                .resizable()
                .modifier(CustomImage(width: 200, height: 200))
        } else {
            Asset.Assets.imgDio.swiftUIImage
                .resizable()
                .modifier(CustomImage(width: 200, height: 200))
        }
    }

    @ViewBuilder
    private func bottomField() -> some View {
        Button("Show PopupView") {
            withAnimation {
                homeviewModel.isFloatingViewVisible = true
                FirebaseAnalytics.logEvent(.eventOne)
            }
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: Asset.Colors.blue.swiftUIColor))

        Button("Select an Image") {
            withAnimation {
                homeviewModel.isShowSourceTypeAlert = true
                FirebaseAnalytics.logEvent(.eventTwo)
            }
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: Asset.Colors.alertRed.swiftUIColor))

        Button("Show HalfModalView") {
            withAnimation {
                homeviewModel.isShowHalfModalView = true
                FirebaseAnalytics.logEvent(.eventThree)
            }
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: Asset.Colors.black.swiftUIColor))

        Button("API Request") {
            let randomID = Int.random(in: 1 ... 10)
            pokemonViewModel.fetchPokemon(id: randomID)
            FirebaseAnalytics.logEvent(.eventFour("API Request"))
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: Asset.Colors.pink.swiftUIColor))
    }

    @ViewBuilder
    private func backgroundField() -> some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
        if homeviewModel.isFloatingViewVisible {
            FloatingView(dismissAction: {
                withAnimation {
                    homeviewModel.isFloatingViewVisible = false
                }
            })
            .transition(.asymmetric(insertion: .opacity, removal: .opacity))
            .zIndex(1)
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
