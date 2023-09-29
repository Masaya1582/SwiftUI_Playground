// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// A rose by any other name would smell as sweet.
  internal static let sampleText1 = L10n.tr("Localizable", "sample_text1", fallback: "A rose by any other name would smell as sweet.")
  /// Genius is one percent inspiration and ninety-nine percent perspiration.
  internal static let sampleText10 = L10n.tr("Localizable", "sample_text10", fallback: "Genius is one percent inspiration and ninety-nine percent perspiration.")
  /// Ask not what your country can do for you; ask what you can do for your country.
  internal static let sampleText2 = L10n.tr("Localizable", "sample_text2", fallback: "Ask not what your country can do for you; ask what you can do for your country.")
  /// Ask, and it shall be given you; seek, and you shall find.
  internal static let sampleText3 = L10n.tr("Localizable", "sample_text3", fallback: "Ask, and it shall be given you; seek, and you shall find.")
  /// Genius is one percent inspiration and ninety-nine percent perspiration.
  internal static let sampleText4 = L10n.tr("Localizable", "sample_text4", fallback: "Genius is one percent inspiration and ninety-nine percent perspiration.")
  /// A rose by any other name would smell as sweet.
  internal static let sampleText5 = L10n.tr("Localizable", "sample_text5", fallback: "A rose by any other name would smell as sweet.")
  /// Ask not what your country can do for you; ask what you can do for your country.
  internal static let sampleText6 = L10n.tr("Localizable", "sample_text6", fallback: "Ask not what your country can do for you; ask what you can do for your country.")
  /// Ask, and it shall be given you; seek, and you shall find.
  internal static let sampleText7 = L10n.tr("Localizable", "sample_text7", fallback: "Ask, and it shall be given you; seek, and you shall find.")
  /// Genius is one percent inspiration and ninety-nine percent perspiration.
  internal static let sampleText8 = L10n.tr("Localizable", "sample_text8", fallback: "Genius is one percent inspiration and ninety-nine percent perspiration.")
  /// Genius is one percent inspiration and ninety-nine percent perspiration.
  internal static let sampleText9 = L10n.tr("Localizable", "sample_text9", fallback: "Genius is one percent inspiration and ninety-nine percent perspiration.")
  /// Every four years, we gather on these steps to carry out the orderly and peaceful transfer of power, and we are grateful to President Obama and First Lady Michelle Obama for their gracious aid throughout this transition. They have been magnificent. Thank you.
  ///         Today’s ceremony, however, has very special meaning, because today we are not merely transferring power from one administration to another, or from one party to another, but we are transferring power from Washington, D.C., and giving it back to you, the people.
  ///         For too long, a small group in our nation’s capital has reaped the rewards of government, while the people have borne the cost. Washington flourished, but the people did not share in its wealth. Politicians prospered, but the jobs left and the factories closed. The establishment protected itself, but not the citizens of our country. Their victories have not been your victories. Their triumphs have not been your triumphs, and while they celebrated in our nation’s capital, there was little to celebrate for struggling families all across our land. That all changes, starting right here and right now, because this moment is your moment --- it belongs to you. It belongs to everyone gathered here today, and everyone watching, all across America. This is your day. This is your celebration, and this, the United States of America, is your country.
  ///         What truly matters is not which party controls our government, but whether our government is controlled by the people. January 20th, 2017 will be remembered as the day the people became the rulers of this nation again. The forgotten men and women of our country, will be forgotten no longer. Everyone is listening to you now. You came by the tens of millions to become part of a historic movement, the likes of which the world has never seen before. At the center of this movement is a crucial conviction, that a nation exists to serve its citizens. Americans want great schools for their children, safe neighborhoods for their families, and good jobs for themselves. These are just and reasonable demands of righteous people and a righteous public, but for too many of our citizens a different reality exists. Mothers and children trapped in poverty in our inner cities, rusted out factories, scattered like tombstones across the across the landscape of our nation, an education system flush with cash, but which leaves our young and beautiful students deprived of all knowledge, and the crime, and the gangs, and the drugs that have stolen too many lives and robbed our country of so much unrealized potential. This American carnage stops right here and stops right now.
  ///         
  internal static let trumpTranscript = L10n.tr("Localizable", "trump_transcript", fallback: "Every four years, we gather on these steps to carry out the orderly and peaceful transfer of power, and we are grateful to President Obama and First Lady Michelle Obama for their gracious aid throughout this transition. They have been magnificent. Thank you.\n        Today’s ceremony, however, has very special meaning, because today we are not merely transferring power from one administration to another, or from one party to another, but we are transferring power from Washington, D.C., and giving it back to you, the people.\n        For too long, a small group in our nation’s capital has reaped the rewards of government, while the people have borne the cost. Washington flourished, but the people did not share in its wealth. Politicians prospered, but the jobs left and the factories closed. The establishment protected itself, but not the citizens of our country. Their victories have not been your victories. Their triumphs have not been your triumphs, and while they celebrated in our nation’s capital, there was little to celebrate for struggling families all across our land. That all changes, starting right here and right now, because this moment is your moment --- it belongs to you. It belongs to everyone gathered here today, and everyone watching, all across America. This is your day. This is your celebration, and this, the United States of America, is your country.\n        What truly matters is not which party controls our government, but whether our government is controlled by the people. January 20th, 2017 will be remembered as the day the people became the rulers of this nation again. The forgotten men and women of our country, will be forgotten no longer. Everyone is listening to you now. You came by the tens of millions to become part of a historic movement, the likes of which the world has never seen before. At the center of this movement is a crucial conviction, that a nation exists to serve its citizens. Americans want great schools for their children, safe neighborhoods for their families, and good jobs for themselves. These are just and reasonable demands of righteous people and a righteous public, but for too many of our citizens a different reality exists. Mothers and children trapped in poverty in our inner cities, rusted out factories, scattered like tombstones across the across the landscape of our nation, an education system flush with cash, but which leaves our young and beautiful students deprived of all knowledge, and the crime, and the gangs, and the drugs that have stolen too many lives and robbed our country of so much unrealized potential. This American carnage stops right here and stops right now.\n        ")
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
