//
//  DefaultModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import CoreMotion

final class Altimator {
    var altimeter: CMAltimeter?

    init() {
        altimeter = CMAltimeter()
    }

    func startUpdate(completion: @escaping (Double) -> Void) {
        guard let altimeter = altimeter else {
            return
        }

        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { data, error in
                if error == nil {
                    guard let pressure = data?.pressure.doubleValue else {
                        return
                    }
                    print("気圧", pressure * 10)
                    completion(pressure * 10)
                } else {
                    // Handle error here
                }
            }
        }
    }

    func stopUpdate() {
        altimeter?.stopRelativeAltitudeUpdates()
    }
}
