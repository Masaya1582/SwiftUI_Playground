//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        AttributedText(getAttributeString())
    }

    private func getAttributeString() -> NSAttributedString {
        let baseString = """
        This is a sentence that includes a link to the settings app.
        This is a sentence that includes a link to the Google search.
        """

        let attributedString = NSMutableAttributedString(string: baseString)
        attributedString.addAttribute(.link,
                                      value: UIApplication.openSettingsURLString,
                                      range: NSString(string: baseString).range(of: "the settings app"))
        attributedString.addAttribute(.link,
                                      value: "https://www.google.co.jp/",
                                      range: NSString(string: baseString).range(of: "the Google search"))
        return attributedString
    }
}

struct AttributedText: UIViewRepresentable {
    var attributedText: NSAttributedString

    init(_ attributedText: NSAttributedString) {
        self.attributedText = attributedText
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        textView.attributedText = attributedText
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
