//
//  SwiftUI_PlaygroundTests.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/22.
//

import XCTest
@testable import SwiftUI_Playground

final class SwiftUI_PlaygroundTests: XCTestCase {

    var pikachu: TestPokemon!

    // This method is called before each test method in the class is called
    override func setUpWithError() throws {
        pikachu = TestPokemon(name: "Pikachu", type: "Electric", health: 100)
    }

    // This method is called after each test method in the class is finished
    override func tearDownWithError() throws {
        pikachu = nil
    }

    // Test the initial state of the Pokemon
    func testPokemonInitialization() throws {
        XCTAssertEqual(pikachu.name, "Pikachu")
        XCTAssertEqual(pikachu.type, "Electric")
        XCTAssertEqual(pikachu.health, 100)
    }

    // Test the damage function
    func testTakeDamage() throws {
        pikachu.takeDamage(40)
        XCTAssertEqual(pikachu.health, 60)

        pikachu.takeDamage(70)
        XCTAssertEqual(pikachu.health, 0)  // Health should not go below 0
    }

    // Test the isFainted method
    func testIsFainted() throws {
        XCTAssertFalse(pikachu.isFainted())

        pikachu.takeDamage(100)
        XCTAssertTrue(pikachu.isFainted())
    }

    // Test performance (optional, but shows how performance tests are structured)
    func testPerformanceExample() throws {
        self.measure {
            for _ in 0..<1000 {
                pikachu.takeDamage(1)
            }
        }
    }

}
