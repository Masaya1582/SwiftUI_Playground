//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

// This component is an airbnb search view with a segmented control for stays and experiences.
// It allows users to search for destinations, select dates, and add guests.

struct HomeView: View {
    @Environment(\.dismiss) private var dismiss

    @State var segmentationSelection : staysAndExperiences = .stays
    enum staysAndExperiences : String, CaseIterable {
        case stays = "Stays"
        case experiences = "Experiences"
    }

    // 1. Create a function to generate destination images with the globe.americas symbol
    func destinationImage() -> some View {
        Image(systemName: "globe.americas")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray)
            .frame(width: 90)
            .background()
            .padding()
    }

    var body: some View {
        ZStack (alignment: .topLeading){
            Color.white.opacity(0.8).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer().frame(height: 10)

                // 2. Update the header with the segmented control
                HStack (alignment: .center){
                    Spacer().frame(width: 5)

                    Button(action: {
                        dismiss()

                    }) {
                        Circle()
                            .strokeBorder(Color.gray,lineWidth: 0.5)
                            .foregroundColor(.black)
                            .frame(width: 30.0, height: 30.0)
                            .overlay(Image(systemName: "xmark"))
                            .font(.system(size: 12))
                            .padding()
                            .accentColor(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))

                    }

                    Picker("", selection: $segmentationSelection) {
                        ForEach(staysAndExperiences.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                }

                VStack (alignment: .leading){
                    Text("Where to?")
                        .bold()
                        .font(.title)
                        .padding()

                    // 3. Update the search button
                    Button(action: {

                    }) {
                        HStack {
                            Spacer()
                                .frame(width: 5.0)
                            Image(systemName: "magnifyingglass")
                            Spacer()
                                .frame(width: 14.0)
                            VStack(alignment: .leading){
                                Text("Search destinations").bold()
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding()
                        .accentColor(.black)
                        .frame(height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                        )
                    }
                    .frame(maxWidth: 350.0)
                    .padding()

                    Spacer().frame(height: 10)

                    // 4. Update the scroll view with destination images
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            Button(action: {

                            }) {
                                VStack (alignment: .leading){
                                    Spacer().frame(height: 5)
                                    destinationImage()
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(.black, lineWidth: 1.5))
                                    Spacer().frame(height: 10)

                                    Text("I'm flexible").foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.089))
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                        .padding(.leading, 1)

                                }
                                .padding(.leading, 8.0)
                            }
                            Button(action: {

                            }) {
                                VStack (alignment: .leading){
                                    Spacer().frame(height: 5)
                                    destinationImage()
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray, lineWidth: 1))
                                    Spacer().frame(height: 10)

                                    Text("Europe").foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.089))
                                        .font(.system(size: 14))
                                        .padding(.leading, 1)

                                }
                            }
                            Button(action: {

                            }) {
                                VStack (alignment: .leading){
                                    Spacer().frame(height: 5)
                                    destinationImage()
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray, lineWidth: 1))
                                    Spacer().frame(height: 10)

                                    Text("South Africa").foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.089))
                                        .font(.system(size: 14))
                                        .padding(.leading, 1)

                                }
                            }
                        }
                    }.padding(.leading, 10)
                    Spacer().frame(height: 10)
                }
                .frame(maxWidth: 335)
                .padding()
                .background(.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(hue: 1.0, saturation: 0.0, brightness: 0.01, opacity: 0.2), lineWidth: 0.5)
                )
                .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)

                Spacer().frame(height: 20)

                // 5. Update the date and guest selection sections
                VStack (alignment: .leading){
                    Spacer().frame(height: 8)

                    HStack {
                        Spacer().frame(width: 10)
                        Text("When").foregroundColor(.gray).bold().font(.system(size: 14))

                        Spacer()
                        Text("Any week").bold().font(.system(size: 14))
                        Spacer().frame(width: 10)
                    }
                    Spacer().frame(height: 8)
                }
                .frame(maxWidth: 335)
                .padding()
                .background(.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hue: 1.0, saturation: 0.0, brightness: 0.01, opacity: 0.2), lineWidth: 0.5)
                )
                .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)

                Spacer().frame(height: 20)

                VStack (alignment: .leading){
                    Spacer().frame(height: 8)

                    HStack {
                        Spacer().frame(width: 10)
                        Text("Who").foregroundColor(.gray).bold().font(.system(size: 14))

                        Spacer()
                        Text("Add guests").bold().font(.system(size: 14))
                        Spacer().frame(width: 10)
                    }
                    Spacer().frame(height: 8)
                }
                .frame(maxWidth: 335)
                .padding()
                .background(.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hue: 1.0, saturation: 0.0, brightness: 0.01, opacity: 0.2), lineWidth: 0.5)
                )
                .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)

                Spacer()

                // 6. Update the search and clear buttons
                VStack (alignment: .center){
                    Spacer().frame(height: 20)
                    HStack {
                        Spacer().frame(width: 30)
                        Button(action: {

                        }) {
                            Text("Clear all")
                                .bold()
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .underline()
                        }

                        Spacer()
                        Button(action: {

                        }) {
                            HStack {
                                Spacer().frame(width: 5)
                                Image(systemName: "magnifyingglass").bold()
                                Text("Search")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 16))
                                Spacer().frame(width: 5)
                            }
                            .padding(15.0)
                            .foregroundColor(.white)
                            .background(Color(red: 1.0, green: 0.2196078431372549, blue: 0.3607843137254902))
                            .cornerRadius(8)
                        }
                        Spacer().frame(width: 30)
                    }
                }
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.0, opacity: 0.5)), alignment: .top)
                .background(.white)
            }
        }.background(BackgroundBlurView())
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .white //adjust this to .clear when implementing in your own code.
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
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
