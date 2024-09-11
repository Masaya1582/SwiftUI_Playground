// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// A rose by any other name would smell as sweet.
  internal static let defaultText1 = L10n.tr("Localizable", "default_text1", fallback: "A rose by any other name would smell as sweet.")
  /// Genius is one percent inspiration and ninety-nine percent perspiration.
  internal static let defaultText10 = L10n.tr("Localizable", "default_text10", fallback: "Genius is one percent inspiration and ninety-nine percent perspiration.")
  /// Ask not what your country can do for you; ask what you can do for your country.
  internal static let defaultText2 = L10n.tr("Localizable", "default_text2", fallback: "Ask not what your country can do for you; ask what you can do for your country.")
  /// Ask, and it shall be given you; seek, and you shall find.
  internal static let defaultText3 = L10n.tr("Localizable", "default_text3", fallback: "Ask, and it shall be given you; seek, and you shall find.")
  /// Genius is one percent inspiration and ninety-nine percent perspiration.
  internal static let defaultText4 = L10n.tr("Localizable", "default_text4", fallback: "Genius is one percent inspiration and ninety-nine percent perspiration.")
  /// A rose by any other name would smell as sweet.
  internal static let defaultText5 = L10n.tr("Localizable", "default_text5", fallback: "A rose by any other name would smell as sweet.")
  /// Ask not what your country can do for you; ask what you can do for your country.
  internal static let defaultText6 = L10n.tr("Localizable", "default_text6", fallback: "Ask not what your country can do for you; ask what you can do for your country.")
  /// Ask, and it shall be given you; seek, and you shall find.
  internal static let defaultText7 = L10n.tr("Localizable", "default_text7", fallback: "Ask, and it shall be given you; seek, and you shall find.")
  /// Genius is one percent inspiration and ninety-nine percent perspiration.
  internal static let defaultText8 = L10n.tr("Localizable", "default_text8", fallback: "Genius is one percent inspiration and ninety-nine percent perspiration.")
  /// Genius is one percent inspiration and ninety-nine percent perspiration.
  internal static let defaultText9 = L10n.tr("Localizable", "default_text9", fallback: "Genius is one percent inspiration and ninety-nine percent perspiration.")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
