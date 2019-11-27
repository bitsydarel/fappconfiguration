import 'package:example/src/about/about_page.dart';
import 'package:example/src/login/login_page.dart';
import 'package:fappconfiguration/fappconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ids.dart';

/// Example default [ApplicationConfiguration].
class DefaultApplicationConfiguration implements ApplicationConfiguration {
  @override
  String get id => "bitsydarel.example";

  @override
  String get name => "Example";

  @override
  List<LocalizationsDelegate> get localizationsDelegates => null;

  @override
  List<Locale> get supportedLanguages =>
      [const Locale.fromSubtags(languageCode: "en")];

  @override
  ThemeData get theme => ThemeData.from(colorScheme: ColorScheme.light());

  @override
  ThemeData get darkTheme => ThemeData.from(colorScheme: ColorScheme.dark());

  @override
  RouteFactory get routeFactory => _defaultRoute;

  @override
  RouteFactory get unknownRouteFactory => _defaultRoute;

  @override
  DynamicWidgetProvider get widgetProvider => (request) {
        if (request.identifier == incrementerFeature) {
          return FloatingActionButton(
            onPressed: request.arguments as void Function(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        }
        throw UnimplementedError(
          "No widget founded with the identifier ${request.identifier}",
        );
      };

  @override
  List<SingleChildCloneableWidget> get dependencies => null;

  PageRoute<Widget> _defaultRoute(final RouteSettings settings) {
    switch (settings.name) {
      case Navigator.defaultRouteName:
        return MaterialPageRoute<LoginPage>(
          settings: settings,
          builder: (context) => LoginPage(),
        );
      case "/about":
        return MaterialPageRoute<AboutPage>(
          settings: settings,
          builder: (context) => AboutPage(),
        );
      default:
        throw UnimplementedError();
    }
  }
}
