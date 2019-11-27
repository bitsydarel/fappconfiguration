import 'package:example/src/configuration/green_application_configuration.dart';
import 'package:example/src/configuration/yellow_application_configuration.dart';
import 'package:fappconfiguration/fappconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Example application login page.
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<ApplicationConfiguration>(
              builder: (_, configuration, __) => Center(
                child: Text(
                  "Login page for ${configuration.name}",
                  style: currentTheme.textTheme.headline,
                ),
              ),
            ),
            const SizedBox(height: 16),
            RaisedButton(
              onPressed: () => _loginYellow(context),
              child: const Text("Yellow White Label"),
            ),
            RaisedButton(
              onPressed: () => _loginGreen(context),
              child: const Text("Green White Label"),
            ),
          ],
        ),
      ),
    );
  }

  void _loginYellow(final BuildContext context) async {
    await FAppConfigurationApplication.update(
      context,
      YellowApplicationConfiguration(),
    );
  }

  void _loginGreen(BuildContext context) async {
    await FAppConfigurationApplication.update(
      context,
      GreenApplicationConfiguration(),
    );
  }
}
