import 'package:example/src/configuration/authenticated_user_application_configuration.dart';
import 'package:flutter/material.dart';

/// Anonymous application configuration.
class AnonymousApplicationConfiguration
    extends AuthenticatedUserApplicationConfiguration {
  @override
  String id() => "${super.id()}.yellow";

  @override
  String name() => "Anonymous";

  @override
  ThemeData theme() {
    final colorScheme = const ColorScheme.light(
      primary: Colors.white,
      primaryVariant: Color(0xffcccccc),
      onPrimary: Colors.black54,
      secondary: Color(0xffffeb3b),
      secondaryVariant: Color(0xffc8b900),
      onSecondary: Color(0x8C000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: ButtonThemeData(colorScheme: colorScheme),
    );
  }

  @override
  ThemeData darkTheme() {
    final colorScheme = const ColorScheme.dark(
      primary: Colors.black,
      primaryVariant: Colors.black,
      onPrimary: Color(0x75ffffff),
      secondary: Color(0xffffeb3b),
      secondaryVariant: Color(0xffc8b900),
      onSecondary: Color(0x8C000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: ButtonThemeData(colorScheme: colorScheme),
    );
  }

  @override
  List<LocalizationsDelegate> localizationsDelegates() => null;
}
