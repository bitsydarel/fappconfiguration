import 'dart:math';

import 'package:example/src/about/about_page.dart';
import 'package:example/src/configuration/default_application_configuration.dart';
import 'package:example/src/home/home_page.dart';
import 'package:example/src/ids.dart';
import 'package:fappconfiguration/fappconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Authenticated user's application configuration.
class AuthenticatedUserApplicationConfiguration
    extends DefaultApplicationConfiguration {
  final Random _random = Random.secure();

  @override
  Route<dynamic> routeFactory(RouteSettings settings) {
    return _route(settings);
  }

  @override
  Route<dynamic> unknownRouteFactory(RouteSettings settings) {
    return _route(settings);
  }

  @override
  Widget widgetProvider(DynamicWidgetRequest request) {
    if (request.identifier == incrementerFeature) {
      return FloatingActionButton(
        onPressed: request.arguments as void Function(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      );
    }
    if (request.identifier == dependencyExample) {
      return Consumer<double>(
        builder: (consumerContext, percentage, __) => AnimatedContainer(
          width: 200 * (percentage ?? .2),
          height: 200 * (percentage ?? .2),
          duration: const Duration(milliseconds: 500),
          color: Theme.of(consumerContext).accentColor,
        ),
      );
    }
    throw UnimplementedError(
      "No widget founded with the identifier ${request.identifier}",
    );
  }

  Route<dynamic> _route(final RouteSettings settings) {
    switch (settings.name) {
      case Navigator.defaultRouteName:
        return MaterialPageRoute<HomePage>(
          settings: settings,
          builder: (context) => HomePage(),
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

  @override
  List<SingleChildWidget> dependencies() => [
        FutureProvider<double>.value(
          value: Future.delayed(
            Duration(seconds: _random.nextInt(3)),
            _random.nextDouble,
          ),
        ),
      ];
}
