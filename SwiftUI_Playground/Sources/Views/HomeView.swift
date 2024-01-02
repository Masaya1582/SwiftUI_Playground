//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import LocalAuthentication

struct HomeView: View {
    @State private var isActive: Bool = false
    @State private var secondsElapsed: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isUnlocked: Bool = false
    @State private var passcode: String = ""
    @State private var animateField: Bool = false
    @State private var noBiometricAccess: Bool = false
    let lockPasscode: String = "1234"
    let context = LAContext()

    var body: some View {
        ZStack {
            VStack {
                Text("\(secondsElapsed)")
                    .font(.system(size: 72, weight: .bold, design: .rounded))
                    .padding()

                Button(action: {
                    self.isActive.toggle()
                    if self.isActive {
                        self.secondsElapsed = 0
                    }
                }) {
                    Text(isActive ? "Stop" : "Start")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .background(isActive ? Color.red : Color.green)
                        .clipShape(Capsule())
                }
            }
            .onReceive(timer) { _ in
                if self.isActive {
                    self.secondsElapsed += 1
                }
            }

            if !isUnlocked {
                NumberPadPasscodeView(passcode: $passcode, animateField: $animateField, isUnlocked: $isUnlocked, noBiometricAccess: $noBiometricAccess, lockPasscode: lockPasscode, context: context)
                    .transition(.move(edge: .bottom))
            }
        }
        .onChange(of: passcode) { newValue in
            if newValue.count == 4 {
                if lockPasscode == passcode {
                    withAnimation {
                        isUnlocked = true
                    }
                } else {
                    passcode = ""
                    animateField.toggle()
                }
            }
        }
    }
}

@ViewBuilder
private func NumberPadPasscodeView(passcode: Binding<String>, animateField: Binding<Bool>, isUnlocked: Binding<Bool>, noBiometricAccess: Binding<Bool>, lockPasscode: String, context: LAContext) -> some View {
    VStack(spacing: 15) {
        Text("Enter Passcode")
            .font(.title.bold())
            .frame(maxWidth: .infinity)

        HStack(spacing: 10) {
            ForEach(0..<4, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 50, height: 55)
                    .overlay {
                        if passcode.wrappedValue.count > index {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 15, height: 15)
                        }
                    }
            }
        }
        .padding(.top, 35)

        Spacer()

        LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 20) {
            ForEach(1...9, id: \.self) { number in
                Button(action: {
                    if passcode.wrappedValue.count < 4 {
                        passcode.wrappedValue.append("\(number)")
                    }
                }) {
                    Text("\(number)")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(width: 75, height: 75)
                        .background(Circle().stroke(Color.black, lineWidth: 2))
                }
            }

            Button(action: {
                if !passcode.wrappedValue.isEmpty {
                    passcode.wrappedValue.removeLast()
                }
            }) {
                Image(systemName: "delete.left")
                    .font(.title)
                    .foregroundColor(.black)
                    .frame(width: 75, height: 75)
                    .background(Circle().stroke(Color.black, lineWidth: 2))
            }

            Button(action: {
                if passcode.wrappedValue.count < 4 {
                    passcode.wrappedValue.append("0")
                }
            }) {
                Text("0")
                    .font(.title)
                    .foregroundColor(.black)
                    .frame(width: 75, height: 75)
                    .background(Circle().stroke(Color.black, lineWidth: 2))
            }
        }
    }
    .padding()
    .background(Color.white)
    .cornerRadius(20)
    .shadow(radius: 10)
    .padding(20)
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
