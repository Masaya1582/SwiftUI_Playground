//
//  FirebaseAnalytics.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/09/10.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import Firebase

struct FirebaseAnalytics {
    // MARK: - Tracking
    static func logEvent(_ event: Event) {
        Firebase.Analytics.logEvent(
            event.name,
            parameters: event.parameters?.compactMapValues { $0 }
        )
    }

    // MARK: - Event
    enum Event {
        case eventOne
        case eventTwo
        case eventThree
        case eventWithParameter(String)

        // MARK: - Name
        var name: String {
            switch self {
            case .eventOne:
                return "event_one"
            case .eventTwo:
                return "event_two"
            case .eventThree:
                return "event_three"
            case .eventWithParameter(let parameter):
                return "event_with_parameter"
            }
        }

        // MARK: - Parameters
        var parameters: [String: Any?]? {
            switch self {
            case .eventOne,
                    .eventTwo,
                    .eventThree:
                return nil
            case .eventWithParameter(let parameter):
                return ["parameter": parameter]
            }
        }
    }
}
