import 'package:example/src/configuration/user_manager.dart';
import 'package:example/src/login/login_page.dart';
import 'package:fappconfiguration/fappconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Example default [ApplicationConfiguration].
class DefaultApplicationConfiguration extends ApplicationConfiguration {
  @override
  String id() => "bitsydarel.example";

  @override
  String name() => "Example";

  @override
  List<LocalizationsDelegate> localizationsDelegates() => null;

  @override
  List<Locale> supportedLanguages() =>
      [const Locale.fromSubtags(languageCode: "en")];

  @override
  ThemeData theme() => ThemeData.from(colorScheme: const ColorScheme.light());

  @override
  ThemeData darkTheme() =>
      ThemeData.from(colorScheme: const ColorScheme.dark());

  @override
  Route<dynamic> routeFactory(RouteSettings settings) {
    return _defaultRoute(settings);
  }

  @override
  Route<dynamic> unknownRouteFactory(RouteSettings settings) {
    return _defaultRoute(settings);
  }

  @override
  Widget widgetProvider(DynamicWidgetRequest request) => null;

  @override
  List<SingleChildWidget> dependencies() =>
      [Provider.value(value: UserManager())];

  Route<dynamic> _defaultRoute(final RouteSettings settings) {
    switch (settings.name) {
      case Navigator.defaultRouteName:
        return MaterialPageRoute<LoginPage>(
          settings: settings,
          builder: (context) => LoginPage(),
        );
      default:
        throw UnimplementedError();
    }
  }
}
