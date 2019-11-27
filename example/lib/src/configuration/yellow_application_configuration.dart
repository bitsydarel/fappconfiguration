import 'dart:math';

import 'package:example/src/configuration/default_application_configuration.dart';
import 'package:example/src/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Yellow application configuration.
class YellowApplicationConfiguration extends DefaultApplicationConfiguration {
  final Random _random = Random.secure();

  @override
  String get id => "${super.id}.yellow";

  @override
  String get name => "${super.name} Yellow";

  @override
  ThemeData get theme {
    final colorScheme = ColorScheme.light(
      primary: Colors.white,
      primaryVariant: const Color(0xffcccccc),
      onPrimary: Colors.black54,
      secondary: const Color(0xffffeb3b),
      secondaryVariant: const Color(0xffc8b900),
      onSecondary: const Color(0x8C000000),
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
      secondary: const Color(0xffffeb3b),
      secondaryVariant: const Color(0xffc8b900),
      onSecondary: const Color(0x8C000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: ButtonThemeData(colorScheme: colorScheme),
    );
  }

  @override
  List<LocalizationsDelegate> get localizationsDelegates => null;

  @override
  RouteFactory get routeFactory {
    return (settings) {
      return settings.name == Navigator.defaultRouteName
          ? MaterialPageRoute<HomePage>(
              settings: settings,
              builder: (context) => HomePage(),
            )
          : super.routeFactory(settings);
    };
  }

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
