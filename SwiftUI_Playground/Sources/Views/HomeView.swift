//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var numberString = ""
    @State private var result = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Decimal Number -> Binary Number")
            Text("Result: \(result)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 20))
            TextField("Input Number", text: $numberString)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                guard let number = Double(numberString) else {
                    return
                }
                result = convert(number: number)
            }, label: {
                Text("Convert")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color(UIColor.lightGray))
            })
        }
    }

    func convert(number: Double) -> String {
        let integer: Int = Int(number)
        let fraction: Double = number.truncatingRemainder(dividingBy: 1)
        return intToBinaryNumberString(number: integer) + "." + doubleToBinaryNumberString(number: fraction)
    }

    func intToBinaryNumberString(number: Int) -> String {
        let remainder: Int = number % 2
        return number / 2 == 0 ? String(remainder) : String(remainder) + intToBinaryNumberString(number: number / 2)
        // or return String(num, radix: 2)
    }

    func doubleToBinaryNumberString(number: Double) -> String {
        var number = number
        var result: String = ""
        for _ in 0...6 {
            number *= 2
            result += String(Int(number))
            number = number.truncatingRemainder(dividingBy: 1)
            if number == 0 {
                return result
            }
        }
        return result + "..."
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
