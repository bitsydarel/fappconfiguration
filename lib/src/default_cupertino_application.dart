import "package:fappconfiguration/src/application_configuration.dart"
    show ApplicationConfiguration;
import 'package:fappconfiguration/src/fappconfiguration_application.dart';
import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import "package:flutter_localizations/flutter_localizations.dart"
    show GlobalCupertinoLocalizations, GlobalWidgetsLocalizations;
import "package:provider/provider.dart" show Provider, MultiProvider;

/// Default iOS Cupertino Application that configure a [CupertinoApp]
/// using the properties of an [ApplicationConfiguration].
class DefaultCupertinoApplication extends FAppConfigurationApplication {
  /// Construct a Cupertino application using [ApplicationConfiguration].
  const DefaultCupertinoApplication(
    final ApplicationConfiguration initialConfiguration, {
    Key key,
  })  : assert(
          initialConfiguration != null,
          "initialConfiguration can't be null",
        ),
        super(initialConfiguration, key: key);

  @override
  _DefaultCupertinoApplicationState createState() =>
      _DefaultCupertinoApplicationState();
}

class _DefaultCupertinoApplicationState
    extends FAppConfigurationApplicationState {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: configuration),
        ...?configuration.dependencies(),
      ],
      child: createIosAppWidget(context),
    );
  }

  CupertinoApp createIosAppWidget(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final themeMode = configuration.themeMode();
    ThemeData currentTheme;

    if (themeMode == ThemeMode.system) {
      currentTheme = platformBrightness == Brightness.light
          ? configuration.theme()
          : configuration.darkTheme();
    } else {
      currentTheme = themeMode == ThemeMode.light
          ? configuration.theme()
          : configuration.darkTheme();
    }

    return CupertinoApp(
      navigatorKey: configurationKey,
      title: configuration.name(),
      theme: MaterialBasedCupertinoThemeData(materialTheme: currentTheme),
      supportedLocales: configuration.supportedLanguages(),
      localizationsDelegates: [
        ...?configuration.localizationsDelegates(),
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      onGenerateRoute: configuration.routeFactory,
      onUnknownRoute: configuration.unknownRouteFactory,
    );
  }
}
