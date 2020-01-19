import 'package:fappconfiguration/src/dynamic_widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

/// An Flutter application configuration.
///
/// Define required information for a flutter application.
abstract class ApplicationConfiguration {
  /// Unique id of the application.
  ///
  /// Refer to applicationId on android.
  ///
  /// Refer to bundle id on iOS.
  String id();

  /// Application name.
  String name();

  /// Application's theme.
  ThemeData theme();

  /// Application's them when dark mode is enabled on both iOS and Android.
  ThemeData darkTheme();

  /// Application's theme mode, by default's system.
  ThemeMode themeMode() => ThemeMode.system;

  /// Application's supported languages.
  List<Locale> supportedLanguages();

  /// Application's localization delegate.
  List<LocalizationsDelegate> localizationsDelegates();

  /// Application's route factory.
  ///
  /// Create application pages based on [RouteSettings]
  Route<dynamic> routeFactory(RouteSettings settings);

  /// Application's unknown route factory.
  ///
  /// Create pages that handle unknown pages based on [RouteSettings].
  Route<dynamic> unknownRouteFactory(RouteSettings settings);

  /// Application's widget provider.
  ///
  /// Create widget dynamically between a page based on [DynamicWidgetRequest].
  Widget widgetProvider(DynamicWidgetRequest request);

  /// The dependency that the application may use when it's launched.
  ///
  /// This would contains a lit of [SingleChildWidget]
  /// of different type that provide dependencies.
  List<SingleChildWidget> dependencies();
}
