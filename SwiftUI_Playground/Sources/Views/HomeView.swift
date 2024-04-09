//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var checkInDate = Date()
    @State private var checkOutDate = Date()
    @State private var imageIndex = 0
    @State private var selectedCard: RoomCard? = nil

    let imageUrls: [String] = [
        "https://www.easthotels.com/miami/-/media/swirehotels/easthotels/east_miami/mediagallery/medialibrary2/full/pool_1.ashx",
        "https://www.easthotels.com/miami/-/media/swirehotels/easthotels/east_miami/mediagallery/medialibrary2/full/eastsuite_1.ashx",
        "https://www.easthotels.com/miami/-/media/swirehotels/easthotels/east_miami/mediagallery/medialibrary2/full/quintomaindining_withpeople.ashx",
        "https://www.easthotels.com/miami/-/media/swirehotels/easthotels/east_miami/mediagallery/medialibary3/pool_events.ashx"
    ]

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 24) {
                        Text("EAST Miami")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.white)

                        TabView(selection: $imageIndex) {
                            ForEach(imageUrls.indices, id: \.self) { index in
                                loadImageFromURL(imageUrls[index])
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 300)
                                    .clipped()
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 300)

                        HStack {
                            Spacer()
                            DatePicker("Check-In", selection: $checkInDate, displayedComponents: .date)
                                .labelsHidden()
                            Text("-")
                            DatePicker("Check-Out", selection: $checkOutDate, displayedComponents: .date)
                                .labelsHidden()
                            Spacer()
                        }
                        .padding(.horizontal)

                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                            ForEach(0..<4, id: \.self) { index in
                                RoomCardView(isDouble: index % 2 == 0, imageUrl: imageUrls[index % imageUrls.count], cardIndex: index) {
                                    withAnimation {
                                        selectedCard = RoomCard(index: index)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
                .blur(radius: selectedCard != nil ? 3 : 0)

                if let selectedCard = selectedCard {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                self.selectedCard = nil
                            }
                        }

                    RoomDetailCardView(isDouble: selectedCard.index % 2 == 0, imageUrls: imageUrls)
                        .frame(width: 350, height: 650)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .transition(.scale)
                        .onTapGesture {
                            withAnimation {
                                self.selectedCard = nil
                            }
                        }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RoomCardView: View {
    var isDouble: Bool
    let imageUrl: String
    let cardIndex: Int
    var onTap: () -> Void

    var body: some View {
        VStack {
            loadImageFromURL(imageUrl)
                .frame(height: 140)
                .clipped()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )

            VStack(alignment: .leading) {
                Text(isDouble ? "Urban Double Room" : "Urban King Room")
                    .font(.headline)
                    .lineLimit(1)
                Text("$99 / night")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding([.horizontal, .bottom])
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .onTapGesture {
            onTap()
        }
    }
}

struct RoomDetailCardView: View {
    var isDouble: Bool
    var imageUrls: [String]
    @State private var selectedAdults = 1
    @State private var selectedChildren = 0

    var body: some View {
        VStack(spacing: 0) {
            TabView {
                ForEach(imageUrls, id: \.self) { imageUrl in
                    loadImageFromURL(imageUrl)
                        .scaledToFill()
                        .frame(width: 350, height: 250)
                        .clipped()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 250)

            ScrollView {
                VStack {
                    Text(isDouble ? "Urban Double Room" : "Urban King Room")
                        .font(.title)
                        .padding(.top, 10)

                    Text("Enjoy a luxurious stay in our spacious room equipped with all the amenities you need for a comfortable stay.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    HStack {
                        VStack {
                            Text("Adults")
                                .font(.headline)
                            Picker("Adults", selection: $selectedAdults) {
                                ForEach(1...5, id: \.self) { count in
                                    Text("\(count)").tag(count)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 100, height: 100)
                            .clipped()
                        }

                        VStack {
                            Text("Children")
                                .font(.headline)
                            Picker("Children", selection: $selectedChildren) {
                                ForEach(0...5, id: \.self) { count in
                                    Text("\(count)").tag(count)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 100, height: 100)
                            .clipped()
                        }
                    }
                    .padding(.top, 10)

                    Button(action: {
                        // Perform an action when the button is tapped
                        print("Book Now Tapped")
                    }) {
                        Text("Book Now")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .frame(width: 200)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.top, 10)
                }
                .padding(.bottom, 20)
            }
            .frame(width: 350)
        }
        .frame(width: 350, height: 650)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct RoomCard: Identifiable {
    let index: Int
    var id: Int { index }
}

func loadImageFromURL(_ urlString: String) -> some View {
    AsyncImage(url: URL(string: urlString)) { phase in
        switch phase {
        case .success(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        case .failure:
            Image(systemName: "photo") // Placeholder for failed image loads
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.secondary)
        case .empty:
            ProgressView() // Placeholder while loading
        @unknown default:
            EmptyView()
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
