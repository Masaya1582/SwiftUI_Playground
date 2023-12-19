//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var birdPosition = CGPoint(x: 100, y: 300)
    @State private var isAlive = true
    @State private var score = 0
    @State private var pipes = [Pipe]()
    private let birdSize = CGSize(width: 60, height: 50)
    private let gravity = CGPoint(x: 0, y: 5)
    private let flapHeight = -80
    private let pipeWidth: CGFloat = 60
    private let pipeGap: CGFloat = 150
    private let pipeMoveSpeed: CGFloat = 3
    private var birdFrame: CGRect {
        CGRect(x: birdPosition.x - birdSize.width / 2, y: birdPosition.y - birdSize.height / 2, width: birdSize.width, height: birdSize.height)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(pipes) { pipe in
                    PipeView(pipe: pipe, pipeWidth: pipeWidth)
                }
                BirdView(position: birdPosition, size: birdSize)
                if !isAlive {
                    Text("Game Over! Score: \(score)")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.blue)
            .onAppear {
                startGame(size: geometry.size)
            }
            .onReceive(Timer.publish(every: 0.016, on: .main, in: .common).autoconnect()) { _ in
                if isAlive {
                    gameLoop(size: geometry.size)
                }
            }
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        if isAlive {
                            birdPosition.y += CGFloat(flapHeight)
                        } else {
                            startGame(size: geometry.size)
                        }
                    }
            )
        }
    }

    private func startGame(size: CGSize) {
        birdPosition = CGPoint(x: 100, y: size.height / 2)
        isAlive = true
        score = 0
        pipes = []
        for i in 0..<3 {
            let pipePosition = CGPoint(x: size.width + CGFloat(i) * size.width / 2, y: CGFloat.random(in: (size.height / 2 - 200)...(size.height / 2 + 200)))
            pipes.append(Pipe(id: i, position: pipePosition))
        }
    }

    func gameLoop(size: CGSize) {
        birdPosition.y += gravity.y
        if birdPosition.y > size.height || birdPosition.y < 0 {
            isAlive = false
        }
        for i in 0..<pipes.count {
            pipes[i].position.x -= pipeMoveSpeed
            if pipes[i].position.x < -pipeWidth {
                pipes[i].position.x = size.width
                pipes[i].position.y = CGFloat.random(in: (size.height / 2 - 200)...(size.height / 2 + 200))
                score += 1
            }
            if pipes[i].frame.intersects(birdFrame) {
                isAlive = false
            }
        }
    }
}

struct BirdView: View {
    var position: CGPoint
    var size: CGSize

    var body: some View {
        Circle()
            .fill(Color.yellow)
            .frame(width: size.width, height: size.height)
            .position(position)
    }
}

struct PipeView: View {
    var pipe: Pipe
    var pipeWidth: CGFloat

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.green)
                .frame(width: pipeWidth, height: pipe.topHeight)
            Spacer().frame(height: 150)
            Rectangle()
                .fill(Color.green)
                .frame(width: pipeWidth, height: pipe.bottomHeight)
        }
        .position(pipe.position)
    }
}

struct Pipe: Identifiable {
    var id: Int
    var position: CGPoint
    var topHeight: CGFloat {
        position.y - 150 / 2
    }
    var bottomHeight: CGFloat {
        UIScreen.main.bounds.height - position.y - 150 / 2
    }
    var frame: CGRect {
        CGRect(x: position.x - 30, y: 0, width: 60, height: UIScreen.main.bounds.height)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
