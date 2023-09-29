//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var percent: Double = 0
    private let text = """
        Every four years, we gather on these steps to carry out the orderly and peaceful transfer of power, and we are grateful to President Obama and First Lady Michelle Obama for their gracious aid throughout this transition. They have been magnificent. Thank you.

        Today’s ceremony, however, has very special meaning, because today we are not merely transferring power from one administration to another, or from one party to another, but we are transferring power from Washington, D.C., and giving it back to you, the people.

        For too long, a small group in our nation’s capital has reaped the rewards of government, while the people have borne the cost. Washington flourished, but the people did not share in its wealth. Politicians prospered, but the jobs left and the factories closed. The establishment protected itself, but not the citizens of our country. Their victories have not been your victories. Their triumphs have not been your triumphs, and while they celebrated in our nation’s capital, there was little to celebrate for struggling families all across our land. That all changes, starting right here and right now, because this moment is your moment --- it belongs to you. It belongs to everyone gathered here today, and everyone watching, all across America. This is your day. This is your celebration, and this, the United States of America, is your country.

        What truly matters is not which party controls our government, but whether our government is controlled by the people. January 20th, 2017 will be remembered as the day the people became the rulers of this nation again. The forgotten men and women of our country, will be forgotten no longer. Everyone is listening to you now. You came by the tens of millions to become part of a historic movement, the likes of which the world has never seen before. At the center of this movement is a crucial conviction, that a nation exists to serve its citizens. Americans want great schools for their children, safe neighborhoods for their families, and good jobs for themselves. These are just and reasonable demands of righteous people and a righteous public, but for too many of our citizens a different reality exists. Mothers and children trapped in poverty in our inner cities, rusted out factories, scattered like tombstones across the across the landscape of our nation, an education system flush with cash, but which leaves our young and beautiful students deprived of all knowledge, and the crime, and the gangs, and the drugs that have stolen too many lives and robbed our country of so much unrealized potential. This American carnage stops right here and stops right now.
        """

    var body: some View {
        VStack {
            TextScrollView(text: text + text + text + text, percent: $percent)
                .modifier(CustomLabel(foregroundColor: .black, size: 16))
            Slider(value: $percent, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
