// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// ℃
  internal static let celsius = L10n.tr("Localizable", "celsius", fallback: "℃")
  /// °
  internal static let degree = L10n.tr("Localizable", "Degree", fallback: "°")
  /// ℉
  internal static let fahrenheit = L10n.tr("Localizable", "fahrenheit", fallback: "℉")
  /// hPa
  internal static let hectopascal = L10n.tr("Localizable", "Hectopascal", fallback: "hPa")
  /// km/h
  internal static let kilometresPerHour = L10n.tr("Localizable", "KilometresPerHour", fallback: "km/h")
  /// Localizable.strings
  ///   ForecastFlow
  /// 
  ///   Created by Tony Chen on 14/9/2024.
  internal static let notAvailable = L10n.tr("Localizable", "NotAvailable", fallback: "Not available")
  /// %%
  internal static let percentage = L10n.tr("Localizable", "percentage", fallback: "%%")
  internal enum CurrentWeather {
    /// cloud
    internal static let cloudIcon = L10n.tr("Localizable", "CurrentWeather.CloudIcon", fallback: "cloud")
    /// Cloud
    internal static let cloudLabel = L10n.tr("Localizable", "CurrentWeather.CloudLabel", fallback: "Cloud")
    /// humidity
    internal static let humidityIcon = L10n.tr("Localizable", "CurrentWeather.HumidityIcon", fallback: "humidity")
    /// Humidity
    internal static let humidityLabel = L10n.tr("Localizable", "CurrentWeather.HumidityLabel", fallback: "Humidity")
    /// Max/Min
    internal static let maxMinLabel = L10n.tr("Localizable", "CurrentWeather.MaxMinLabel", fallback: "Max/Min")
    /// barometer
    internal static let pressureBarMeterIcon = L10n.tr("Localizable", "CurrentWeather.PressureBarMeterIcon", fallback: "barometer")
    /// Pressure
    internal static let pressureLabel = L10n.tr("Localizable", "CurrentWeather.PressureLabel", fallback: "Pressure")
    /// Sun raise
    internal static let sunraiseLabel = L10n.tr("Localizable", "CurrentWeather.SunraiseLabel", fallback: "Sun raise")
    /// sunrise
    internal static let sunriseIcon = L10n.tr("Localizable", "CurrentWeather.SunriseIcon", fallback: "sunrise")
    /// sunset
    internal static let sunsetIcon = L10n.tr("Localizable", "CurrentWeather.SunsetIcon", fallback: "sunset")
    /// Sun set
    internal static let sunsetLabel = L10n.tr("Localizable", "CurrentWeather.SunsetLabel", fallback: "Sun set")
    /// thermometer.sun
    internal static let thermometerIcon = L10n.tr("Localizable", "CurrentWeather.ThermometerIcon", fallback: "thermometer.sun")
    /// wind
    internal static let windIcon = L10n.tr("Localizable", "CurrentWeather.WindIcon", fallback: "wind")
    /// Wind
    internal static let windLabel = L10n.tr("Localizable", "CurrentWeather.WindLabel", fallback: "Wind")
  }
  internal enum Onboarding {
    /// Get Start
    internal static let getStart = L10n.tr("Localizable", "Onboarding.GetStart", fallback: "Get Start")
  }
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
