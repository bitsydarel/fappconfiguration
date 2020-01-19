import 'package:example/src/configuration/authenticated_user_application_configuration.dart';
import 'package:flutter/material.dart';

/// Premium application configuration.
class PremiumApplicationConfiguration
    extends AuthenticatedUserApplicationConfiguration {
  @override
  String id() => "${super.id()}.premium";

  @override
  String name() => "Premium";

  @override
  ThemeData theme() {
    final colorScheme = ColorScheme.light(
      primary: Colors.white,
      primaryVariant: const Color(0xffcccccc),
      onPrimary: Colors.black54,
      secondary: const Color(0xffef9a9a),
      secondaryVariant: const Color(0xffba6b6c),
      onSecondary: const Color(0x9E000000),
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
      secondary: Color(0xffef9a9a),
      secondaryVariant: Color(0xffba6b6c),
      onSecondary: Color(0x9E000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: ButtonThemeData(colorScheme: colorScheme),
    );
  }
}
