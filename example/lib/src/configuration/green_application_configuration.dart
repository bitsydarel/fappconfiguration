import 'dart:math';

import 'package:example/src/configuration/default_application_configuration.dart';
import 'package:example/src/green/green_about_page.dart';
import 'package:example/src/green/green_dynamic_widget.dart';
import 'package:example/src/home/home_page.dart';
import 'package:example/src/ids.dart';
import 'package:fappconfiguration/fappconfiguration.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

/// Green white label application configuration.
class GreenApplicationConfiguration extends DefaultApplicationConfiguration {
  final Random _random = Random.secure();

  @override
  String get id => "${super.id}.green";

  @override
  String get name => "${super.name} Green";

  @override
  ThemeData get theme {
    final colorScheme = ColorScheme.light(
      primary: Colors.white,
      primaryVariant: const Color(0xffcccccc),
      onPrimary: Colors.black54,
      secondary: const Color(0xff00e676),
      secondaryVariant: const Color(0xff00b248),
      onSecondary: const Color(0x94000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: ButtonThemeData(colorScheme: colorScheme),
    );
  }

  @override
  ThemeData get darkTheme {
    final colorScheme = ColorScheme.dark(
      primary: Colors.black,
      primaryVariant: Colors.black,
      onPrimary: const Color(0x75ffffff),
      secondary: const Color(0xff00e676),
      secondaryVariant: const Color(0xff00b248),
      onSecondary: const Color(0x94000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: ButtonThemeData(colorScheme: colorScheme),
    );
  }

  @override
  RouteFactory get routeFactory {
    return (settings) {
      switch (settings.name) {
        case Navigator.defaultRouteName:
          return MaterialPageRoute<HomePage>(
            settings: settings,
            builder: (context) => HomePage(),
          );
        case "/about":
          return MaterialPageRoute<GreenAboutPage>(
            settings: settings,
            builder: (context) => GreenAboutPage(),
          );
        default:
          return super.routeFactory(settings);
      }
    };
  }

  @override
  DynamicWidgetProvider get widgetProvider => (request) {
        if (request.identifier == incrementerFeature) {
          return GreenDynamicWidget(
            request.arguments as void Function(),
          );
        }
        throw UnimplementedError(
          "no widget founded with the identifier ${request.identifier}",
        );
      };

  @override
  List<SingleChildCloneableWidget> get dependencies => [
        FutureProvider<double>.value(
          value: Future.delayed(
            Duration(seconds: _random.nextInt(3)),
            _random.nextDouble,
          ),
        ),
      ];
}
