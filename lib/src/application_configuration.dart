import 'package:fappconfiguration/src/dynamic_widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// An Flutter application configuration.
///
/// Define required information for a flutter application.
abstract class ApplicationConfiguration {
  /// Unique id of the application.
  ///
  /// Refer to applicationId on android.
  ///
  /// Refer to bundle id on iOS.
  String get id;

  /// Application name.
  String get name;

  /// Application's theme.
  ThemeData get theme;

  /// Application's them when dark mode is enabled on both iOS and Android.
  ThemeData get darkTheme;

  /// Application's supported languages.
  List<Locale> get supportedLanguages;

  /// Application's localization delegate.
  List<LocalizationsDelegate> get localizationsDelegates;

  /// Application's route factory.
  ///
  /// Create application pages based on [RouteSettings]
  RouteFactory get routeFactory;

  /// Application's unknown route factory.
  ///
  /// Create pages that handle unknown pages based on [RouteSettings].
  RouteFactory get unknownRouteFactory;

  /// Application's widget provider.
  ///
  /// Create widget dynamically between a page based on [DynamicWidgetRequest].
  DynamicWidgetProvider get widgetProvider;

  /// The dependency that the application may use when it's launched.
  ///
  /// This would contains a lit of [Provider] of different type that provide
  /// dependencies.
  List<SingleChildCloneableWidget> get dependencies;
}
