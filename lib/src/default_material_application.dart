import "package:fappconfiguration/src/application_configuration.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart"
    show GlobalMaterialLocalizations, GlobalWidgetsLocalizations;
import "package:meta/meta.dart" show literal;
import "package:provider/provider.dart" show Consumer, Provider;

/// Default Material Application that configure a [MaterialApp] using the
/// [ApplicationConfiguration].
class DefaultMaterialApplication extends StatelessWidget {
  /// Construct a [DefaultMaterialApplication] with the provided
  /// [ApplicationConfiguration].
  @literal
  const DefaultMaterialApplication(this._configuration, {Key key})
      : assert(_configuration != null, "configuration can't be null"),
        super(key: key);

  final ApplicationConfiguration _configuration;

  @override
  Widget build(BuildContext context) {
    return Provider<ApplicationConfiguration>.value(
      value: _configuration,
      child: Consumer<ApplicationConfiguration>(
        builder: (context, value, _) => MaterialApp(
          title: value.name,
          theme: value.theme,
          darkTheme: value.darkTheme,
          supportedLocales: value.supportedLanguages,
          localizationsDelegates: [
            value.localizationsDelegate,
            GlobalMaterialLocalizations
                .delegate /*Only required if using MaterialApp Widget*/,
            GlobalWidgetsLocalizations.delegate,
          ],
          onGenerateRoute: value.routeFactory,
          onUnknownRoute: value.unknownRouteFactory,
        ),
      ),
    );
  }
}
