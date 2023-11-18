//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum Ability {
    case electric
    case fire
    case water
}

enum AbilityError: Error {
    case incompatibleAbilities
    case unknownAbility
}

struct HomeView: View {
    @State private var firstAbility: Ability = .electric
    @State private var secondAbility: Ability = .fire
    @State private var errorMessage: String = ""

    var body: some View {
        VStack {
            Picker("First Ability", selection: $firstAbility) {
                Text("Electric").tag(Ability.electric)
                Text("Fire").tag(Ability.fire)
                Text("Water").tag(Ability.water)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Picker("Second Ability", selection: $secondAbility) {
                Text("Electric").tag(Ability.electric)
                Text("Fire").tag(Ability.fire)
                Text("Water").tag(Ability.water)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button("Interact Abilities") {
                do {
                    try performAbilityInteraction(firstAbility: firstAbility, secondAbility: secondAbility)
                    errorMessage = "Abilities interacted successfully!"
                } catch let error as AbilityError {
                    errorMessage = errorMessage(from: error)
                } catch {
                    errorMessage = "Unknown error occurred"
                }
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
            Text(errorMessage)
                .modifier(CustomLabel(foregroundColor: .red, size: 20))
            Spacer()
        }
        .padding()
    }

    // Function simulating an interaction between two Pokémon abilities, throwing errors for incompatible interactions
    private func performAbilityInteraction(firstAbility: Ability, secondAbility: Ability) throws {
        switch (firstAbility, secondAbility) {
        case (.electric, .water), (.water, .electric):
            throw AbilityError.incompatibleAbilities
        case (.fire, .water), (.water, .fire):
            throw AbilityError.incompatibleAbilities
        default:
            break
        }
    }

    // Function to generate error messages based on specific ability errors
    private func errorMessage(from error: AbilityError) -> String {
        switch error {
        case .incompatibleAbilities:
            return "These abilities are incompatible."
        case .unknownAbility:
            return "Unknown ability error."
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
