//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var offset: CGSize = .zero
    @State private var isDragging = false

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
                .offset(offset)
                .gesture(DragGesture()
                    .onChanged { value in
                        self.offset = value.translation
                        self.isDragging = true
                    }
                    .onEnded { value in
                        withAnimation {
                            self.offset = .zero
                            self.isDragging = false
                        }
                    }
                )

            if isDragging {
                Text("Dragging!")
                    .font(.title)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .offset(y: -30)
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
