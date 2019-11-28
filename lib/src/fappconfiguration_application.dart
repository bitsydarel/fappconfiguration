import 'package:fappconfiguration/src/application_configuration.dart';
import 'package:flutter/widgets.dart';
import "package:meta/meta.dart" show literal, protected, mustCallSuper;

/// Flutter application widget that manage a [ApplicationConfiguration].
///
/// It's allow you to configure your app using a [ApplicationConfiguration].
///
/// Allow you to update the application's configuration using [update].
abstract class FAppConfigurationApplication extends StatefulWidget {
  /// Construct a [FAppConfigurationApplication] with [initialConfiguration].
  @literal
  const FAppConfigurationApplication(this.initialConfiguration, {Key key})
      : assert(
          initialConfiguration != null,
          "initialConfiguration can't be null",
        ),
        super(key: key);

  /// [FAppConfigurationApplication]'s initial configuration.
  @protected
  final ApplicationConfiguration initialConfiguration;

  /// Update the [FAppConfigurationApplication]'s
  /// current [ApplicationConfiguration] with [newConfiguration].
  static Future<bool> update(
    final BuildContext context,
    final ApplicationConfiguration newConfiguration,
  ) async {
    final state = context.ancestorStateOfType(
      const TypeMatcher<FAppConfigurationApplicationState>(),
    ) as FAppConfigurationApplicationState;

    if (state?.mounted == true) {
      state.updateConfiguration(newConfiguration);
      return true;
    }
    return false;
  }

  @override
  FAppConfigurationApplicationState createState();
}

/// [FAppConfigurationApplication]'s state.
///
/// Keep track of the application's [configuration].
///
/// Allow to update the [configuration] using [updateConfiguration]
abstract class FAppConfigurationApplicationState
    extends State<FAppConfigurationApplication> {
  /// [FAppConfigurationApplicationState]'s current [ApplicationConfiguration].
  @protected
  ApplicationConfiguration configuration;

  /// [FAppConfigurationApplicationState]'s
  /// current [ApplicationConfiguration] state key.
  @protected
  GlobalKey<NavigatorState> configurationKey;

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    configuration = widget.initialConfiguration;
    configurationKey = GlobalKey(
      debugLabel: widget.initialConfiguration.runtimeType.toString(),
    );
  }

  /// Update the [FAppConfigurationApplication]'s [ApplicationConfiguration].
  /// [newConfiguration] to apply.
  @protected
  void updateConfiguration(final ApplicationConfiguration newConfiguration) {
    setState(() {
      configuration = newConfiguration;
      configurationKey = GlobalKey(
        debugLabel: newConfiguration.runtimeType.toString(),
      );
    });
  }
}
