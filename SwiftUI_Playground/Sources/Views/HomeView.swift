//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedRoom: String? = nil
    private let rooms = ["Living Room", "Bedroom", "Kitchen", "Bathroom"]

    var body: some View {
        VStack {
            Text("Select a Room")
                .font(.largeTitle)
                .padding()

            ForEach(rooms, id: \.self) { room in
                RoomButton(room: room, selectedRoom: $selectedRoom)
            }
        }
        .padding()
    }
}

struct RoomButton: View {
    let room: String
    @Binding var selectedRoom: String?

    var body: some View {
        Button(action: {
            withAnimation {
                selectedRoom = room
            }
        }) {
            Text(room)
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity)
                .background(selectedRoom == room ? Color.gray : Color.clear)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(selectedRoom == room ? Color.black : Color.gray, lineWidth: 2)
                )
                .foregroundColor(.black)
        }
        .padding(.horizontal)
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
