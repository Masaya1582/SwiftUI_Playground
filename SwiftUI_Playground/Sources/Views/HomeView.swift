//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import MapKit

struct HomeView: View {
    init(){
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(.red)
    }

    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            SampleView()
                .tabItem {
                    Label("Wishlists", systemImage: "suit.heart").environment(\.symbolVariants, .none)
                }
            SampleView()
                .tabItem {

                    Text("Trips")
                    Image(systemName: "a.circle")
                }
            SampleView()
                .tabItem {
                    Label("Inbox", systemImage: "bubble.middle.bottom")
                        .environment(\.symbolVariants, .none)
                }
            SampleView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                        .environment(\.symbolVariants, .none)
                }

        }
        .accentColor(.red)
    }
}


struct SampleView: View {
    var body: some View {
        Text("Sample View")
            .font(.title)
    }
}

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    @State var searchClicked = false

    var body: some View {
        VStack {
            // 1. Search bar
            ZStack(alignment: .trailing) {
                Button(action: {
                    print("outer button pressed")
                    searchClicked = true
                }) {
                    HStack {
                        Spacer()
                            .frame(width: 5.0)
                        Image(systemName: "magnifyingglass")
                        Spacer()
                            .frame(width: 14.0)
                        VStack(alignment: .leading){

                            Text("Where to?").bold()
                                .font(.system(size: 14))

                            Text("Anywhere • Any week • Add guests")
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                                .font(.system(size: 12))

                        }

                        Spacer()
                    }
                    .padding()
                    .accentColor(.black)

                    .clipShape(RoundedRectangle(cornerRadius: 14.0, style: .continuous))
                    .background(
                        RoundedRectangle(cornerRadius: 30.0)
                            .fill(.white)

                    )
                    .shadow(color: .gray.opacity(0.4), radius: 6, x: 0, y: 0)

                }
                .frame(maxWidth: 350.0)
                .padding()



                Button(action: {}) {
                    Circle()    .strokeBorder(Color.gray,lineWidth: 0.5)
                        .foregroundColor(.white)
                        .frame(width: 40.0, height: 40.0)
                        .overlay(Image(systemName: "slider.horizontal.3"))
                        .padding()
                        .accentColor(Color.black)


                        .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))

                }
                .padding()
            }

            // 2. Categories list
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(["Treehouses", "Countryside", "Castles", "Vinyards", "Mansions"], id: \.self) { title in
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "building.columns")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25))
                                Text(title)
                                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.089))
                                    .font(.system(size: 14))
                            }
                            .padding(.leading, 10.0)
                        }
                    }
                }
            }
            .padding(.leading, 10)


            // 3. Map view
            ZStack(alignment: .bottom) {
                Map(coordinateRegion: $region, showsUserLocation: false, userTrackingMode: .constant(.follow))
                    .frame(width: 400, height: 500)
            }
        }
        .background(Color.white.shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.578), radius: 0.5, x: 0, y: 1))
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
