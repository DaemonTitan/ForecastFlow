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
  internal enum Alert {
    internal enum Button {
      /// Dismiss
      internal static let dismiss = L10n.tr("Localizable", "Alert.Button.Dismiss", fallback: "Dismiss")
      /// Settings
      internal static let settings = L10n.tr("Localizable", "Alert.Button.Settings", fallback: "Settings")
    }
  }
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
  internal enum DateFormat {
    /// MMM d
    internal static let dateFormat = L10n.tr("Localizable", "DateFormat.DateFormat", fallback: "MMM d")
    /// yyyy-MM-dd HH:mm:ss
    internal static let dateTimeFormat = L10n.tr("Localizable", "DateFormat.DateTimeFormat", fallback: "yyyy-MM-dd HH:mm:ss")
    /// hh:mm a
    internal static let sunRiseSetTimeFormat = L10n.tr("Localizable", "DateFormat.sunRiseSetTimeFormat", fallback: "hh:mm a")
    /// h a
    internal static let timeFormat = L10n.tr("Localizable", "DateFormat.TimeFormat", fallback: "h a")
  }
  internal enum Day {
    /// Next 3 Days
    internal static let next3Days = L10n.tr("Localizable", "Day.Next3Days", fallback: "Next 3 Days")
    /// OptionList
    internal static let optionList = L10n.tr("Localizable", "Day.OptionList", fallback: "OptionList")
    /// Today
    internal static let today = L10n.tr("Localizable", "Day.Today", fallback: "Today")
    /// Tomorrow
    internal static let tomorrow = L10n.tr("Localizable", "Day.tomorrow", fallback: "Tomorrow")
  }
  internal enum Error {
    internal enum Location {
      /// Location service has been denied
      internal static let deniedDescription = L10n.tr("Localizable", "Error.Location.DeniedDescription", fallback: "Location service has been denied")
      /// Please go to location settings to enable location service.
      internal static let deniedReason = L10n.tr("Localizable", "Error.Location.DeniedReason", fallback: "Please go to location settings to enable location service.")
      /// Location access error
      internal static let notDeterminedDescription = L10n.tr("Localizable", "Error.Location.NotDeterminedDescription", fallback: "Location access error")
      /// App can not access location servcie, please go to location settings to enable location service.
      internal static let notDeterminedReason = L10n.tr("Localizable", "Error.Location.NotDeterminedReason", fallback: "App can not access location servcie, please go to location settings to enable location service.")
      /// App does not have authorise to access your location
      internal static let restrictedDescription = L10n.tr("Localizable", "Error.Location.RestrictedDescription", fallback: "App does not have authorise to access your location")
      /// Please change settings to allow location access.
      internal static let restrictedReason = L10n.tr("Localizable", "Error.Location.RestrictedReason", fallback: "Please change settings to allow location access.")
    }
  }
  internal enum ForecastWeather {
    /// arrow.down
    internal static let arrowDownIcon = L10n.tr("Localizable", "ForecastWeather.ArrowDownIcon", fallback: "arrow.down")
    /// arrow.up
    internal static let arrowUpIcon = L10n.tr("Localizable", "ForecastWeather.ArrowUpIcon", fallback: "arrow.up")
  }
  internal enum Onboarding {
    /// chevron.left
    internal static let chevronLeftIcon = L10n.tr("Localizable", "Onboarding.ChevronLeftIcon", fallback: "chevron.left")
    /// chevron.right
    internal static let chevronRightIcon = L10n.tr("Localizable", "Onboarding.ChevronRightIcon", fallback: "chevron.right")
    /// Get Start
    internal static let getStart = L10n.tr("Localizable", "Onboarding.GetStart", fallback: "Get Start")
    /// Get Start
    internal static let timeFormat = L10n.tr("Localizable", "Onboarding.timeFormat", fallback: "Get Start")
    internal enum Step1 {
      /// Get instant access to the current weather conditions in your area. Never get caught unprepared again!
      internal static let body = L10n.tr("Localizable", "Onboarding.Step1.Body", fallback: "Get instant access to the current weather conditions in your area. Never get caught unprepared again!")
      /// Stay Updated with Real-time Weather
      internal static let title = L10n.tr("Localizable", "Onboarding.Step1.Title", fallback: "Stay Updated with Real-time Weather")
    }
    internal enum Step2 {
      /// Looking for more than just current conditions? Stay informed about upcoming weather patterns and make informed decisions.
      internal static let body = L10n.tr("Localizable", "Onboarding.Step2.Body", fallback: "Looking for more than just current conditions? Stay informed about upcoming weather patterns and make informed decisions.")
      /// Plan Ahead with Weather Forecasts
      internal static let title = L10n.tr("Localizable", "Onboarding.Step2.Title", fallback: "Plan Ahead with Weather Forecasts")
    }
    internal enum Step3 {
      /// We need access to your current location! Don't worry, we prioritize your privacy and only use your location to deliver personalized weather updates.
      internal static let body = L10n.tr("Localizable", "Onboarding.Step3.Body", fallback: "We need access to your current location! Don't worry, we prioritize your privacy and only use your location to deliver personalized weather updates.")
      /// Access Real-time Weather Anywhere
      internal static let title = L10n.tr("Localizable", "Onboarding.Step3.Title", fallback: "Access Real-time Weather Anywhere")
    }
  }
  internal enum Time {
    /// am
    internal static let lowercaseAM = L10n.tr("Localizable", "Time.LowercaseAM", fallback: "am")
    /// pm
    internal static let lowercasePM = L10n.tr("Localizable", "Time.LowercasePM", fallback: "pm")
    /// NOW
    internal static let now = L10n.tr("Localizable", "Time.Now", fallback: "NOW")
    /// AM
    internal static let uppercaseAM = L10n.tr("Localizable", "Time.UppercaseAM", fallback: "AM")
    /// PM
    internal static let uppercasePM = L10n.tr("Localizable", "Time.UppercasePM", fallback: "PM")
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
