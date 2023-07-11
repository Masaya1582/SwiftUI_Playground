//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State var foodTypes: [FoodType] = [
        FoodType(
            name: "Meat",
            foods: [
                Food(check: true, name: "Beef"),
                Food(check: true, name: "Pork"),
                Food(check: true, name: "Chicken"),
                Food(check: true, name: "Mutton"),
                Food(check: true, name: "Venison")
            ]
        ),
        FoodType(
            name: "Fish",
            foods: [
                Food(check: true, name: "Tuna"),
                Food(check: true, name: "Mackerel"),
                Food(check: true, name: "Salmon"),
                Food(check: true, name: "Shark"),
                Food(check: true, name: "Bonito"),
                Food(check: true, name: "Monkfish"),
                Food(check: true, name: "Sardine"),
                Food(check: true, name: "Moray"),
                Food(check: true, name: "Eel"),
                Food(check: true, name: "Ray")
            ]
        ),
        FoodType(
            name: "Fruit",
            foods: [
                Food(check: true, name: "Apple"),
                Food(check: true, name: "Banana"),
                Food(check: true, name: "Orange"),
                Food(check: true, name: "Peach")
            ]
        )
    ]
    
    var body: some View {
        List {
            ForEach(0 ..< self.foodTypes.count, id: \.self) { foodTypeIndex in
                Section(header: Text(self.foodTypes[foodTypeIndex].name)) {
                    ForEach(0 ..< self.foodTypes[foodTypeIndex].foods.count, id: \.self) { foodIndex in
                        Button(action: {
                            self.foodTypes[foodTypeIndex].foods[foodIndex].check.toggle()
                        }) {
                            ListRow(check: self.foodTypes[foodTypeIndex].foods[foodIndex].check, name: self.foodTypes[foodTypeIndex].foods[foodIndex].name)
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea([.bottom])
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
