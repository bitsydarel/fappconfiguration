import "package:fappconfiguration/src/application_configuration.dart"
    show ApplicationConfiguration;
import "package:flutter/cupertino.dart";
import "package:flutter_localizations/flutter_localizations.dart"
    show GlobalCupertinoLocalizations, GlobalWidgetsLocalizations;
import "package:provider/provider.dart" show Consumer, Provider;

/// Default iOS Cupertino Application that configure a [CupertinoApp] using the
/// [ApplicationConfiguration].
class DefaultCupertinoApplication extends StatelessWidget {
  /// Construct a Cupertino application using [ApplicationConfiguration].
  const DefaultCupertinoApplication(this._configuration, {Key key})
      : assert(_configuration != null, "configuration can't be null"),
        super(key: key);

  final ApplicationConfiguration _configuration;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _configuration,
      child: Consumer<ApplicationConfiguration>(builder: (context, value, _) {
        return CupertinoApp(
          title: value.name,
          theme: CupertinoThemeData(
            primaryColor: value.theme.primaryColor,
            primaryContrastingColor: value.theme.accentColor,
            brightness: value.theme.brightness,
            textTheme: CupertinoTextThemeData(
              navTitleTextStyle: value.theme.textTheme.title,
            ),
          ),
          supportedLocales: value.supportedLanguages,
          localizationsDelegates: [
            value.localizationsDelegate,
            GlobalCupertinoLocalizations.delegate
            /*Only required if using Cupertino Widget*/,
            GlobalWidgetsLocalizations.delegate,
          ],
          onGenerateRoute: value.routeFactory,
          onUnknownRoute: value.unknownRouteFactory,
        );
      }),
    );
  }
}
