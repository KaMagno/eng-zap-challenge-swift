// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// No properties available at the moment
  internal static let emptyMessage = L10n.tr("Localizable", "empty-message")
  /// %i bathroom
  internal static func numberBathRooms(_ p1: Int) -> String {
    return L10n.tr("Localizable", "number-bath-rooms", p1)
  }
  /// %i bathrooms
  internal static func numberBathRoomsPlural(_ p1: Int) -> String {
    return L10n.tr("Localizable", "number-bath-rooms-plural", p1)
  }
  /// %i bedroom
  internal static func numberBedRooms(_ p1: Int) -> String {
    return L10n.tr("Localizable", "number-bed-rooms", p1)
  }
  /// %i bedrooms
  internal static func numberBedRoomsPlural(_ p1: Int) -> String {
    return L10n.tr("Localizable", "number-bed-rooms-plural", p1)
  }
  /// %i parking space
  internal static func numberParkingArea(_ p1: Int) -> String {
    return L10n.tr("Localizable", "number-parking-area", p1)
  }
  /// %i parking space
  internal static func numberParkingAreaPlural(_ p1: Int) -> String {
    return L10n.tr("Localizable", "number-parking-area-plural", p1)
  }
  /// Rental
  internal static let rental = L10n.tr("Localizable", "rental")
  /// Sale
  internal static let sale = L10n.tr("Localizable", "sale")
  /// Try Again
  internal static let tryAgain = L10n.tr("Localizable", "try-again")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
