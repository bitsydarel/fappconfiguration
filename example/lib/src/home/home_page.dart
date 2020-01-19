import 'package:example/src/configuration/default_application_configuration.dart';
import 'package:example/src/ids.dart';
import 'package:fappconfiguration/fappconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Application's home page.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ApplicationConfiguration>(
          builder: (_, configuration, __) => Text(
            "Configuration for ${configuration.name()}",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_box),
            onPressed: () => Navigator.of(context).pushNamed("/about"),
          ),
          FlatButton(
            onPressed: () async {
              await FAppConfigurationApplication.update(
                context,
                DefaultApplicationConfiguration(),
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 8),
            const Text(
              "Accessing dependency for a configuration"
              "\nLike the pourcentage of progress for example",
            ),
            const SizedBox(height: 8),
            Consumer<ApplicationConfiguration>(
              builder: (consumerContext, configuration, _) {
                return configuration.widgetProvider(
                  DynamicWidgetRequest(dependencyExample),
                );
              },
            ),
            const SizedBox(height: 8),
            const Text("Example of different theme of each configuration"),
            const SizedBox(height: 8),
            const CircularProgressIndicator(),
            const SizedBox(height: 8),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            const SizedBox(height: 16),
            const Text(
              "The button at the right end of the screen "
              "is dynamically loaded depending on the configuration",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<ApplicationConfiguration>(
        builder: (_, configuration, __) {
          return configuration.widgetProvider(
            DynamicWidgetRequest(
              incrementerFeature,
              arguments: _incrementCounter,
            ),
          );
        },
      ),
    );
  }
}
