import "package:fappconfiguration/src/application_configuration.dart";
import 'package:fappconfiguration/src/fappconfiguration_application.dart';
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:meta/meta.dart" show literal;
import "package:provider/provider.dart" show MultiProvider, Provider;

/// Default Material Application that configure a [MaterialApp]
/// using the properties of an [ApplicationConfiguration].
class DefaultMaterialApplication extends FAppConfigurationApplication {
  /// Construct a [DefaultMaterialApplication] with the provided
  /// [initialConfiguration].
  @literal
  const DefaultMaterialApplication(
    final ApplicationConfiguration initialConfiguration, {
    Key key,
  })  : assert(
          initialConfiguration != null,
          "initialConfiguration can't be null",
        ),
        super(initialConfiguration, key: key);

  @override
  _DefaultMaterialApplicationState createState() =>
      _DefaultMaterialApplicationState();
}

class _DefaultMaterialApplicationState
    extends FAppConfigurationApplicationState {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: configuration),
        ...?configuration.dependencies(),
      ],
      child: MaterialApp(
        navigatorKey: configurationKey,
        title: configuration.name(),
        theme: configuration.theme(),
        darkTheme: configuration.darkTheme(),
        themeMode: configuration.themeMode(),
        supportedLocales: configuration.supportedLanguages(),
        localizationsDelegates: [
          ...?configuration.localizationsDelegates(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        onGenerateRoute: configuration.routeFactory,
        onUnknownRoute: configuration.unknownRouteFactory,
      ),
    );
  }
}
