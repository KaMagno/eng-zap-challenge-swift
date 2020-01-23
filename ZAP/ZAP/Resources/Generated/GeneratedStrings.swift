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
  /// bathroom
  internal static let numberBathRooms = L10n.tr("Localizable", "number-bath-rooms")
  /// bathrooms
  internal static let numberBathRoomsPlural = L10n.tr("Localizable", "number-bath-rooms-plural")
  /// bedroom
  internal static let numberBedRooms = L10n.tr("Localizable", "number-bed-rooms")
  /// bedrooms
  internal static let numberBedRoomsPlural = L10n.tr("Localizable", "number-bed-rooms-plural")
  /// parking
  internal static let numberParkingArea = L10n.tr("Localizable", "number-parking-area")
  /// parkings
  internal static let numberParkingAreaPlural = L10n.tr("Localizable", "number-parking-area-plural")
  /// Rental
  internal static let rental = L10n.tr("Localizable", "rental")
  /// Sale
  internal static let sale = L10n.tr("Localizable", "sale")
  /// Try Again
  internal static let tryAgain = L10n.tr("Localizable", "try-again")
  /// Value
  internal static let value = L10n.tr("Localizable", "value")
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
