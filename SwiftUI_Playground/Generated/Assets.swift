// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
    import AppKit
#elseif os(iOS)
    import UIKit
#elseif os(tvOS) || os(watchOS)
    import UIKit
#endif
#if canImport(SwiftUI)
    import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
enum Asset {
    enum Assets {
        static let accentColor = ColorAsset(name: "AccentColor")
        static let imgApple = ImageAsset(name: "img_apple")
        static let imgDio = ImageAsset(name: "img_dio")
        static let imgGoodluck = ImageAsset(name: "img_goodluck")
        static let imgHeadback = ImageAsset(name: "img_headback")
        static let imgYoshi = ImageAsset(name: "img_yoshi")
        static let imgBurger = ImageAsset(name: "img_burger")
        static let imgNuggets = ImageAsset(name: "img_nuggets")
        static let imgPancakes = ImageAsset(name: "img_pancakes")
        static let imgPizza = ImageAsset(name: "img_pizza")
        static let imgSpaghetti = ImageAsset(name: "img_spaghetti")
        static let imgBanana = ImageAsset(name: "img_banana")
        static let imgGrape = ImageAsset(name: "img_grape")
        static let imgMango = ImageAsset(name: "img_mango")
        static let imgOrange = ImageAsset(name: "img_orange")
        static let imgPineapple = ImageAsset(name: "img_pineapple")
        static let imgStrawberry = ImageAsset(name: "img_strawberry")
        static let imgBarack = ImageAsset(name: "img_barack")
        static let imgBill = ImageAsset(name: "img_bill")
        static let imgDonald = ImageAsset(name: "img_donald")
        static let imgGeorgeHw = ImageAsset(name: "img_george_hw")
        static let imgGeorgeW = ImageAsset(name: "img_george_w")
        static let imgGerald = ImageAsset(name: "img_gerald")
        static let imgJimmy = ImageAsset(name: "img_jimmy")
        static let imgRonald = ImageAsset(name: "img_ronald")
        static let imgBackground = ImageAsset(name: "img_background")
    }

    enum Colors {
        static let alertRed = ColorAsset(name: "alert_red")
        static let black = ColorAsset(name: "black")
        static let blue = ColorAsset(name: "blue")
        static let gray1 = ColorAsset(name: "gray1")
        static let gray2 = ColorAsset(name: "gray2")
        static let gray3 = ColorAsset(name: "gray3")
        static let gray4 = ColorAsset(name: "gray4")
        static let gray5 = ColorAsset(name: "gray5")
        static let gray6 = ColorAsset(name: "gray6")
        static let gray7 = ColorAsset(name: "gray7")
        static let gray8 = ColorAsset(name: "gray8")
        static let gray9 = ColorAsset(name: "gray9")
        static let green = ColorAsset(name: "green")
        static let ivory = ColorAsset(name: "ivory")
        static let pink = ColorAsset(name: "pink")
        static let white = ColorAsset(name: "white")
    }
}

// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

final class ColorAsset {
    fileprivate(set) var name: String

    #if os(macOS)
        typealias Color = NSColor
    #elseif os(iOS) || os(tvOS) || os(watchOS)
        typealias Color = UIColor
    #endif

    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    private(set) lazy var color: Color = {
        guard let color = Color(asset: self) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }()

    #if os(iOS) || os(tvOS)
        @available(iOS 11.0, tvOS 11.0, *)
        func color(compatibleWith traitCollection: UITraitCollection) -> Color {
            let bundle = BundleToken.bundle
            guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
                fatalError("Unable to load color asset named \(name).")
            }
            return color
        }
    #endif

    #if canImport(SwiftUI)
        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
        private(set) lazy var swiftUIColor: SwiftUI.Color = .init(asset: self)
    #endif

    fileprivate init(name: String) {
        self.name = name
    }
}

extension ColorAsset.Color {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    convenience init?(asset: ColorAsset) {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
            self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            self.init(named: NSColor.Name(asset.name), bundle: bundle)
        #elseif os(watchOS)
            self.init(named: asset.name)
        #endif
    }
}

#if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    extension SwiftUI.Color {
        init(asset: ColorAsset) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle)
        }
    }
#endif

struct ImageAsset {
    fileprivate(set) var name: String

    #if os(macOS)
        typealias Image = NSImage
    #elseif os(iOS) || os(tvOS) || os(watchOS)
        typealias Image = UIImage
    #endif

    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
    var image: Image {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
            let image = Image(named: name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            let name = NSImage.Name(self.name)
            let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
        #elseif os(watchOS)
            let image = Image(named: name)
        #endif
        guard let result = image else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }

    #if os(iOS) || os(tvOS)
        @available(iOS 8.0, tvOS 9.0, *)
        func image(compatibleWith traitCollection: UITraitCollection) -> Image {
            let bundle = BundleToken.bundle
            guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
                fatalError("Unable to load image asset named \(name).")
            }
            return result
        }
    #endif

    #if canImport(SwiftUI)
        @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
        var swiftUIImage: SwiftUI.Image {
            SwiftUI.Image(asset: self)
        }
    #endif
}

extension ImageAsset.Image {
    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
    @available(macOS, deprecated,
               message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init?(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
            let bundle = BundleToken.bundle
            self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            self.init(named: NSImage.Name(asset.name))
        #elseif os(watchOS)
            self.init(named: asset.name)
        #endif
    }
}

#if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    extension SwiftUI.Image {
        init(asset: ImageAsset) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle)
        }

        init(asset: ImageAsset, label: Text) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle, label: label)
        }

        init(decorative asset: ImageAsset) {
            let bundle = BundleToken.bundle
            self.init(decorative: asset.name, bundle: bundle)
        }
    }
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
