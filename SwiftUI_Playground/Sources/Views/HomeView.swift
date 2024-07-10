//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

/*
 This component creates a scrollable grid of rectangle images with a specified width and height, and applies a custom border.
 Additionally, the background color is changed to #17ABFF (rgb: 23, 171, 255).

 Steps:
 1. Create a custom view called RectangleImage that conforms to the View protocol.
 2. Define the width and height properties for the rectangle image.
 3. Add the body property to display the image with the specified width and height.
 4. Use the "chair" image as a placeholder for the rectangle image.
 5. Apply a custom border with specified color, width, corner radius, and corner smoothing.
 6. Update the ContentView to include the scrollable grid of RectangleImage and the new background color.
 7. Modify the grid to display two columns as per the user input.
 8. Add a title to the top left of the screen that says "social app".
 */

struct RectangleImage: View {
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        ZStack {
            Image("img_spaghetti")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 37, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 37, style: .continuous)
                    .stroke(Color(red: 250/255, green: 255/255, blue: 0/255), lineWidth: 4))
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        // action
                    }) {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 30, height: 30)
                            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                    }
                    .padding()
                }
                Spacer()
            }
        }
        .frame(width: width, height: height)
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            // Step 8: Add a title to the top left of the screen that says "social app"
            HStack {
                Text("Social App")
                    .font(.system(size: 32, weight: .heavy, design: .rounded))
                    .padding(.top, 30)
                    .padding(.leading)
                    .foregroundColor(.white)

                Spacer()

                Button(action: {

                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 24, weight: .heavy))
                        .foregroundColor(Color.white)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .padding(.top, 30)
                        .padding(.trailing, 30)
                }
            }
            .padding(.top, 50)

            Spacer()

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 175), spacing: 16), GridItem(.adaptive(minimum: 175), spacing: 16)], spacing: 16) {
                    ForEach(0..<8) { _ in
                        RectangleImage(width: 170, height: 250)
                    }
                }
                .padding()
            }
        }
        .background(Color(red: 23/255, green: 171/255, blue: 255/255))
        .edgesIgnoringSafeArea(.all)
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
