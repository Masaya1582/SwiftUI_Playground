//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct Character: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

struct HomeView: View {
    @State private var selectedCharacter: Character?

    let characters = [
        Character(name: "Warrior", image: "warrior"),
        Character(name: "Mage", image: "mage"),
        Character(name: "Archer", image: "archer")
    ]

    var body: some View {
        VStack {
            Text("Select Your Character")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(characters) { character in
                        CharacterCardView(character: character, isSelected: selectedCharacter?.id == character.id)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedCharacter = character
                                }
                            }
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical)

            if let selectedCharacter = selectedCharacter {
                Text("You selected: \(selectedCharacter.name)")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top)
            } else {
                Text("Tap on a character to select")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.top)
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct CharacterCardView: View {
    let character: Character
    var isSelected: Bool

    var body: some View {
        VStack {
            Image(character.image)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                .overlay(
                    Circle()
                        // .stroke(isSelected ? LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing) : Color.clear, lineWidth: 4)
                        .scaleEffect(isSelected ? 1.1 : 1.0)
                        .animation(.easeInOut)
                )
                .padding()

            Text(character.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 5)
        }
        .frame(width: 150, height: 200)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .scaleEffect(isSelected ? 1.1 : 1.0)
        .animation(.spring())
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
